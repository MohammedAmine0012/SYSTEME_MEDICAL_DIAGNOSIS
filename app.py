from flask import Flask, render_template, request
from pyswip import Prolog

# Initialize the Flask app
app = Flask(__name__)

import os
print(os.getcwd)
# Initialize the Prolog engine
prolog = Prolog()
prolog.consult("diagnosisss.pl")

@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        inputs = {
            "age": int(request.form["age"]),
            "sex": request.form["sex"],
            "ba": float(request.form["ba"]),
            "bgr": float(request.form["bgr"]),
            "bu": float(request.form["bu"]),
            "sc": float(request.form["sc"]),
            "sod": float(request.form["sod"]),
            "hemo": float(request.form["hemo"]),
            "pvc": float(request.form["pvc"]),
            "wc": float(request.form["wc"]),
            "rc": float(request.form["rc"]),
            "htn": int(request.form["htn"]),
            "dm": int(request.form["dm"]),
            "cad": int(request.form["cad"]),
            "appetite": request.form["appetite"],
            "pe": int(request.form["pe"]),
            "ane": int(request.form["ane"]),
        }

        # Construct the Prolog query
        query = (
            f"predire_diagnostic({inputs['age']}, '{inputs['sex']}', {inputs['ba']}, "
            f"{inputs['bgr']}, {inputs['bu']}, {inputs['sc']}, {inputs['sod']}, "
            f"{inputs['hemo']}, {inputs['pvc']}, {inputs['wc']}, {inputs['rc']}, "
            f"{inputs['htn']}, {inputs['dm']}, {inputs['cad']}, '{inputs['appetite']}', "
            f"{inputs['pe']}, {inputs['ane']}, Diagnosis)."
        )

        # Execute the Prolog query
        try:
            result = list(prolog.query(query))
            if result:
                diagnosis = result[0]["Diagnosis"]
            else:
                diagnosis = "No diagnosis found. Please check the inputs."
        except Exception as e:
            diagnosis = f"Error executing query: {str(e)}"

        return render_template("index.html", diagnosis=diagnosis)

    return render_template("index.html", diagnosis=None)

if __name__ == "__main__":
    app.run(debug=True)
