from flask import Flask, render_template, request, g
import tiny_enchanter as model

app = Flask(__name__)

@app.route("/")
@app.route("/index")
def home():
    return render_template('index.html')

@app.route("/choice")
def choice():
    return render_template('choice.html')

@app.route("/result", methods=('POST', 'GET'))
def result():
    gender = request.form['gender']
    animal_ears = request.form['animalears']
    tail = request.form['tail']
    hair_style = request.form['hairstyle']
    hair_ornament = request.form['hairornament']
    hair_color = request.form['hair-color']
    eyes_color = request.form['eyes-color']
    clothes = request.form['clothes']

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

    # images = run_model(doc)

    return render_template('show_image.html')

# @app.after_request
# @after_this_request

def run_model(doc):
    url = "http://127.0.0.1:7860"
    checkpoints, pos_prompt, neg_prompt, steps, cfg_scale = model.get_data(doc)
    images = []

    for checkpoint in checkpoints:
        i = checkpoints.index(checkpoint) + 1
        images += model.draw_image(url, checkpoint, pos_prompt, neg_prompt, steps, cfg_scale, file_name=f'result_{i}')

    return images

if __name__ == "__main__":
    app.run(debug=True)