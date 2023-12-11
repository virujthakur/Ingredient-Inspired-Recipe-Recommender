from flask import Flask, request, jsonify
from fastai.vision.all import *
from flask_cors import CORS
import pathlib
temp = pathlib.PosixPath
pathlib.PosixPath = pathlib.WindowsPath

app = Flask(__name__)
CORS(app)

# Loading the pre-trained model using colab
learn = load_learner('resnet50_precision.pkl')

@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Check if the request contains files
        if 'file' not in request.files:
            return jsonify({'error': 'No files provided'})

        files = request.files.getlist('file')

        predictions = []

        for file in files:
            # Check if the file is an allowed type (e.g., JPEG, PNG)
            allowed_extensions = {'png', 'jpg', 'jpeg'}
            if file.filename.split('.')[-1].lower() not in allowed_extensions:
                return jsonify({'error': 'Invalid file type'})

            # Open the image and make predictions
            image = PILImage.create(file)
            prediction, _, _ = learn.predict(image)
            predictions.append(str(prediction))

        # Return the predictions as JSON
        return jsonify({'predictions': predictions})

    except Exception as e:
        return jsonify({'error': str(e)})

if __name__ == '__main__':
    app.run(debug=True)
