
# Fertilizers Model

This project is an **AWS Lambda function** that serves a machine learning model built using **scikit-learn**. The model takes **soil type** and **crop type** as inputs and predicts the recommended **fertilizer** to use for optimal crop growth.

## Features

- **Soil and Crop Type Inputs**: The model uses soil type (e.g., loamy, clay, sandy) and crop type (e.g., wheat, rice, corn) as input features.
- **Fertilizer Prediction**: Based on the inputs, the model predicts the best fertilizer type to use for the given soil and crop combination.
- **AWS Lambda**: The model is deployed as an AWS Lambda function, offering a scalable and serverless architecture.
- **Machine Learning Model**: Built using scikit-learn, the model predicts fertilizer recommendations based on soil and crop characteristics.

## Technologies Used

- **AWS Lambda**: Serverless compute service used to deploy the model, handling incoming requests without the need for server management.
- **scikit-learn**: The machine learning library used to build and train the predictive model.
- **Pandas**: Used for data manipulation and preprocessing before training the model.
- **NumPy**: Used for numerical operations required for model predictions.
  
## How It Works

1. The user sends a request to the AWS Lambda function with the **soil type** and **crop type** as input.
2. The Lambda function processes the input, passing it to the trained scikit-learn model.
3. The model predicts the most suitable fertilizer based on the provided inputs.
4. The function returns the recommended fertilizer name.




This AWS Lambda function provides a serverless solution for predicting the best fertilizer based on soil and crop types. It demonstrates the practical application of machine learning in agriculture and provides a scalable tool for farmers, agronomists, and researchers.
