import uvicorn
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse, Response
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
import json
import tiny_enchanter as model

app = FastAPI()
templates = Jinja2Templates(directory="templates")
app.mount("/static", StaticFiles(directory="static"), name="static")

@app.get('/', response_class=HTMLResponse)
async def home(request: Request):
    return templates.TemplateResponse("index.html", {"request": request}) 

@app.get('/aboutus', response_class=HTMLResponse)
async def aboutus(request: Request):
    return templates.TemplateResponse("aboutus.html", {"request": request})

@app.get('/choice', response_class=HTMLResponse)
async def choice(request: Request):
    return templates.TemplateResponse("choice.html", {"request": request})

@app.post('/result', response_class=HTMLResponse)
async def result_loading(request: Request):
    form_data = await request.form()
    gender = form_data.get('gender')
    animal_ears = form_data.get('animalears')
    tail = form_data.get('tail')
    hair_style = form_data.get('hairstyle')
    hair_ornament = form_data.get('hairornament')
    hair_color = form_data.get('haircolor')
    eyes_color = form_data.get('eyescolor')
    clothes = form_data.get('clothes')

    doc = {
        "00": "00",
        "01": gender,
        "02": animal_ears,
        "03": tail,
        "04": hair_style,
        "05": hair_ornament,
        "06": hair_color,
        "07": eyes_color,
        "08": clothes
    }

    return templates.TemplateResponse("result.html", {"request": request, "doc": doc})

@app.get('/get_cps', response_class=Response)
async def get_cps(request: Request):
    '''
    모델 돌리기 이전 체크포인트, 로라 목록 받아오는 부분
    '''
    try:
        cps = model.get_checkpoints()
        checkpoints = list(cps.keys())
        lora_prompts = list(cps.values())
    except:
        return Response(content=json.dumps({"detail": "DataBase Connection Error"}), status_code=404)
    else:
        return Response(content=json.dumps({"checkpoints": checkpoints, "loraprompts": lora_prompts}), status_code=200)
        
@app.post('/image_generate', response_class=Response)
async def image_generate(request: Request):
    txts_b = await request.body()
    txts = list(json.loads(txts_b).values())

    url = "http://127.0.0.1:7860"
    img_no = txts[0]
    doc = txts[1]
    # checkpoint = txts[2]
    checkpoint = "qteamixQ_gamma"
    pos_prompt, neg_prompt, steps, cfg_scale = model.get_data(doc)
    pos_prompt += ", " + txts[3]
    file_name = model.generate_file_name(doc, img_no)

    try:
        model_response = model.draw_image(url, checkpoint, pos_prompt, neg_prompt, steps, cfg_scale, file_name=file_name)
        if model_response.startswith('https'):
            return Response(content=json.dumps({"filename": file_name, "filelink": model_response}), status_code=200)
        else:
            return Response(content=json.dumps({"detail": model_response}), status_code=404)
    except:
        return Response(content=json.dumps({"detail": "Model Connection Error"}), status_code=404)

@app.get('/wrong', response_class=HTMLResponse)
async def home(request: Request):
    return templates.TemplateResponse("wrong.html", {"request": request})

if __name__ == '__main__':
    uvicorn.run("connection:app", host="0.0.0.0", reload=True)
# uvicorn connection:app --reload