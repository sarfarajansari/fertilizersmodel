# Get the directory of the current script
import os
import pickle

featureNames = [
    "soilType",
    "cropType",
    "nitrogen",
    "potassium",
    "phosphorous"
]


script_dir = os.path.dirname(os.path.realpath(__file__))

# Loading Model
file_path = os.path.join(script_dir, "save/rf_pipeline.pkl")
with open(file_path, "rb") as model_file:
    model = pickle.load(model_file)

# Loading Encode
file_path = os.path.join(script_dir, "save/Encode.pkl")
with open(file_path, "rb") as Encode_file:
    Encode = pickle.load(Encode_file)

print("Model : \n", model)
print("Encode : \n", Encode)