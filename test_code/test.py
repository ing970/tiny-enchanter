import json
import requests
import io
import base64
from PIL import Image, PngImagePlugin

def load_model(url, checkpoint, pos_prompt, neg_prompt, steps, cfg_scale):
    change_model(checkpoint)
    payload = {
        "enable_hr": False,
        "denoising_strength": 0,
        "firstphase_width":0,
        "firstphase_height":0,
        "prompt":pos_prompt,
        "styles":["string"],
        "seed":-1,
        "subseed":-1,
        "subseed_strength":0,
        "seed_resize_from_h": -1,
        "seed_resize_from_w": -1,
        "batch_size":1,
        "n_iter":1,
        "steps":steps,
        "cfg_scale":cfg_scale,
        "width":512,
        "height":512,
        "restore_faces":False,
        "tiling":False,
        "negative_prompt":neg_prompt,
        "eta":0,
        "s_churn":0,
        "s_tmax": 0,
        "s_tmin": 0,
        "s_noise": 1,
        "sampler_index" : "Euler"
    }
    response = requests.post(url=f'{url}/sdapi/v1/txt2img', json=payload)
    r = response.json()
    for i in r['images']:
        image = Image.open(io.BytesIO(base64.b64decode(i.split(",",1)[0])))
        png_payload = {
            "image": "data:image/png;base64," + i
        }
        response2 = requests.post(url=f'{url}/sdapi/v1/png-info', json=png_payload)
        pnginfo = PngImagePlugin.PngInfo()
        pnginfo.add_text("parameters", response2.json().get("info"))
        image.save('output.png', pnginfo=pnginfo)

def change_model(checkpoint):
    option_payload = {
        "sd_model_checkpoint": checkpoint
    }
    response = requests.post(url=f'{url}/sdapi/v1/options', json=option_payload)

if __name__ == "__main__":
    url = "http://127.0.0.1:7860"
    checkpoint = "qteamixQ_gamma"
    pos_prompt = "1boy, solo, blue hair, animal ears, chibi, white background, <lora:BlueSD:1>"
    neg_prompt = "(jpeg artifacts), (blurry), (blurred), (blur), bad anatomy, worst quality, bad quality, disfigured, deformed, malformed, mutant, gross, disgusting, out of frame, monochrome, poorly drawn, extra limbs, extra fingers, missing limbs, misshaped, poorly drawn, mutated hands and fingers, ugly, fat, cubism, text, logo, duplicate, bad eyes, misaligned eyes, deformed mouth, lowres, signature, watermark, username, dots, error, cropped, easynegative"
    steps = 40
    cfg_scale = 4
    load_model(url, checkpoint, pos_prompt, neg_prompt, steps, cfg_scale)
