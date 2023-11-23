from model import featureNames, model, Encode
from sklearn import semi_supervised

def preProcess(data):

    data[0] = Encode["Encoders"]["Soil Type"].transform([data[0]])[0]
    data[1] = Encode["Encoders"]["Crop Type"].transform([data[1]])[0]

    return data


def handler(event,context):
    data = event
    if "queryStringParameters" in event:
        data = event["queryStringParameters"]
        
    features = [data[featureName] for featureName in featureNames]

    features = preProcess(features)
    print(features)

    prediction = model.predict([features])[0]
    prediction = Encode["InvertEncodings"]["Fertilizer Name"][prediction]

    print("\n\n\nPrediction : ", prediction)
    print("\n---Sent---")

    return {"prediction": prediction}


# TEST
if __name__ == "__main__":
    handler({
        "soilType": "Sandy",
        "cropType": "Maize",
        "nitrogen": 36,
        "potassium": 0,
        "phosphorous": 0
    })
