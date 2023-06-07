import requests
import io
import base64
import pymysql
from PIL import Image, PngImagePlugin

db_pw = '' #password 입력 필요

def draw_image(url, checkpoint, pos_prompt, neg_prompt, steps, cfg_scale, width=512, height=512, seed=-1, file_name="result", sampler_index="Euler a"):
    '''
    Stable Diffusion Web UI(API 모드)를 이용하여 이미지를 생성 후 반환
    '''
    # Checkpoint Model 변경
    change_cp_model(url, checkpoint)

    # 이미지 생성
    payload = {
        "prompt": pos_prompt,
        "seed": seed,
        "steps": steps,
        "cfg_scale": cfg_scale,
        "width": width,
        "height": height,
        "negative_prompt": neg_prompt,
        "sampler_index": sampler_index
    }
    response = requests.post(url=f'{url}/sdapi/v1/txt2img', json=payload)
    r = response.json()

    # 이미지 파일(*.png), 로그(database) 저장
    images = []
    for i in r['images']:
        save_image(i, file_name)
        images.append(i)

        with pymysql.connect(host='localhost', user='root', password=db_pw, db='NINI', charset='utf8') as conn: #password 입력 필요
            sql = "INSERT INTO result (Image) VALUES (%s)"
            execute_query(conn, sql, (i,))
            
    return images

def change_cp_model(url, checkpoint):
    '''
    체크포인트 모델 변경
    '''
    option_payload = {
        "sd_model_checkpoint": checkpoint
    }
    response = requests.post(url=f'{url}/sdapi/v1/options', json=option_payload)

def get_data(doc):
    '''
    디비에 저장된 데이터 반환
    '''
    checkpoints = []
    pos_prompt = ""
    neg_prompt = ""
    steps = 40
    cfg_scale = 4

    if doc['01'] == '02' and doc['08'] == '01':
        doc['08'] = '99'

    with pymysql.connect(host='localhost', user='root', password=db_pw, db='NINI', charset='utf8') as conn: #password 입력 필요
        sql = f"SELECT checkpoint_model.Cp_model_name FROM checkpoint_model"
        query_result = execute_query(conn, sql)
        if query_result:
            if query_result[0][0]:
                for qr in query_result:
                    checkpoints.append(qr[0])

        for key, value in doc.items():
            check_txt = key + value

            sql = f"SELECT checkbox.Checkbox_p_prompt FROM checkbox LEFT JOIN client_order on checkbox.Checkbox_id = client_order.Checkbox_id WHERE client_order.Checkbox_id = {check_txt}"
            query_result = execute_query(conn, sql)
            if query_result:
                if query_result[0][0]:
                    pos_prompt += ", " + query_result[0][0]

            sql = f"SELECT checkbox.Checkbox_n_prompt FROM checkbox LEFT JOIN client_order on checkbox.Checkbox_id = client_order.Checkbox_id WHERE client_order.Checkbox_id = {check_txt}"
            query_result = execute_query(conn, sql)
            if query_result:
                if query_result[0][0]:
                    neg_prompt += ", " + query_result[0][0]

    return checkpoints, pos_prompt.lstrip(", "), neg_prompt.lstrip(", "), steps, cfg_scale

def execute_query(conn, sql, cdn_url=None):
    '''
    입력된 sql 쿼리 실행
    '''
    cursor = conn.cursor()
    keyword = sql.split(' ')[0]

    if keyword == 'SELECT':
        cursor.execute(sql)
        result = cursor.fetchall()
        conn.commit()
        cursor.close()
        return result

    if keyword == 'INSERT':
        cursor.execute(sql, (cdn_url,))
        conn.commit()
        cursor.close()

def save_image(img, file_name):
    '''
    이미지 파일을 png로 저장
    '''
    image = Image.open(io.BytesIO(base64.b64decode(img.split(",",1)[0])))
    png_payload = {
        "image": "data:image/png;base64," + img
    }
    response2 = requests.post(url=f'{url}/sdapi/v1/png-info', json=png_payload)
    pnginfo = PngImagePlugin.PngInfo()
    pnginfo.add_text("parameters", response2.json().get("info"))
    image.save(f'NiNi/static/image/{file_name}.png', pnginfo=pnginfo)

if __name__ == "__main__":
    url = "http://127.0.0.1:7860"
    doc = {
        "00": "00",
        "01": "01",
        "02": "00",
        "03": "01",
        "04": "01",
        "05": "01",
        "06": "00",
        "07": "00",
        "08": "00"
    } #임의로 들어간 데이터
    checkpoints, pos_prompt, neg_prompt, steps, cfg_scale = get_data(doc)
    
    for checkpoint in checkpoints:
        i = checkpoints.index(checkpoint) + 1
        draw_image(url, checkpoint, pos_prompt, neg_prompt, steps, cfg_scale, file_name=f'result_{i}')