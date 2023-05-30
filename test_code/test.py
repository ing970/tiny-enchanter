import json
import requests
import io
import base64
from PIL import Image, PngImagePlugin

def draw_image(url, checkpoint, pos_prompt, neg_prompt, steps, cfg_scale):
    # Stable Diffusion Web UI(API 모드)를 이용하여 이미지를 생성하는 로직
    change_cp_model(checkpoint)
    payload = {
        "prompt": pos_prompt,
        "steps": steps,
        "cfg_scale": cfg_scale,
        "width": 512,
        "height": 512,
        "negative_prompt": neg_prompt,
        "sampler_index": "Euler"
    }
    response = requests.post(url=f'{url}/sdapi/v1/txt2img', json=payload)
    r = response.json()

    # 이미지를 저장하는 로직
    for i in r['images']:
        image = Image.open(io.BytesIO(base64.b64decode(i.split(",",1)[0])))
        png_payload = {
            "image": "data:image/png;base64," + i
        }
        response2 = requests.post(url=f'{url}/sdapi/v1/png-info', json=png_payload)
        pnginfo = PngImagePlugin.PngInfo()
        pnginfo.add_text("parameters", response2.json().get("info"))
        image.save('output.png', pnginfo=pnginfo)

    print("success")

def change_cp_model(checkpoint):
    # 체크포인트 모델을 변경하는 로직
    option_payload = {
        "sd_model_checkpoint": checkpoint
    }
    response = requests.post(url=f'{url}/sdapi/v1/options', json=option_payload)

def get_data():
    # 프론트에서 데이터를 받아오는 로직 (미완)
    front_data = {
        "00": "00",
        "01": "01",
        "02": "00",
        "03": "02",
        "04": "01",
        "05": "01",
        "06": "00",
        "07": "00",
        "08": "00"
    }
    return approach_database(front_data)

def approach_database(front_data):
    # 디비에 접근 후 데이터를 받아오는 로직
    checkpoints = []
    pos_prompt = ""
    neg_prompt = ""
    steps = 40
    cfg_scale = 4

    for key, value in front_data.items():
        check_txt = key + value

        sql = f"SELECT checkpoint_model.Cp_model_name FROM checkpoint_model LEFT JOIN client_order on checkpoint_model.Cp_model_id = client_order.Cp_model_id WHERE client_order.Checkbox_id = {check_txt}"
        query_result = execute_query(sql)
        if query_result:
            if query_result[0][0]:
                checkpoints.append(query_result[0][0])

        sql = f"SELECT checkbox.Checkbox_p_prompt FROM checkbox LEFT JOIN client_order on checkbox.Checkbox_id = client_order.Checkbox_id WHERE client_order.Checkbox_id = {check_txt}"
        query_result = execute_query(sql)
        if query_result:
            if query_result[0][0]:
                pos_prompt += ", " + query_result[0][0]

        sql = f"SELECT checkbox.Checkbox_n_prompt FROM checkbox LEFT JOIN client_order on checkbox.Checkbox_id = client_order.Checkbox_id WHERE client_order.Checkbox_id = {check_txt}"
        query_result = execute_query(sql)
        if query_result:
            if query_result[0][0]:
                neg_prompt += ", " + query_result[0][0]

    # 가장 빈도수 높은 체크포인트 모델 선정
    checkpoints_count = {}
    for cp in checkpoints:
        try:
            checkpoints_count[cp] += 1
        except:
            checkpoints_count[cp] = 1
    checkpoint = max(checkpoints_count, key=checkpoints_count.get)

    return checkpoint, pos_prompt.lstrip(", "), neg_prompt.lstrip(", "), steps, cfg_scale

def execute_query(sql):
    # 입력된 sql 쿼리를 실행시키는 로직

    import pymysql

    conn = pymysql.connect(host='localhost', user='root', password='pw', db='nini', charset='utf8') #password 입력 필요
    cursor = conn.cursor()
    cursor.execute(sql)
    result = cursor.fetchall()
    conn.commit()
    conn.close()
    
    return result

if __name__ == "__main__":
    url = "http://127.0.0.1:7860"
    checkpoint, pos_prompt, neg_prompt, steps, cfg_scale = get_data()
    draw_image(url, checkpoint, pos_prompt, neg_prompt, steps, cfg_scale)
