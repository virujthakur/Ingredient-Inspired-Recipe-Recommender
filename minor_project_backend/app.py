from flask import Flask, request, jsonify
import pandas as pd
from fastai.vision.all import *
from flask_cors import CORS
import pathlib
temp = pathlib.PosixPath
# pathlib.PosixPath = pathlib.WindowsPath
import json
from flask import jsonify
from geoloc import get_user_location
from geoloc import find_nearby_places


app = Flask(__name__)
CORS(app)

# Loading the pre-trained model using colab

learn = load_learner('resnet_101.pkl')
recipes_df = pd.read_excel('Minor Project.xlsx', sheet_name= 'Recipes2Ing')  # Adjust the filename as needed

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

        # search for recipes after prediction
        if not predictions:
            return jsonify({'error': 'Please provide at least one ingredient.'}), 400

        recipes= get_recipes_by_ingredients(predictions)
        json_response = json.dumps(recipes)
        # Return the predictions as JSON
        # print(jsonify(recipes))
        return jsonify({'Recipes': json_response})

    except Exception as e:
        return jsonify({'error': str(e)})


# Get recipes based on ingredient list
def get_recipes_by_ingredients(ingredient_list):
    print(ingredient_list)
    # if not recipes_df:
    #     print('false')
    # print(recipes_df)
    filtered_recipes = []

    # print(len(recipes_df))
    for index, row in recipes_df.iterrows():
        # print(row)
        ingredients = row['Recipes'].split(';')
        cooking_time = row['Cooking Time']  # Assuming Ingredients column contains comma-separated values
        # print(ingredients)
        if all(ingredient in ingredients for ingredient in ingredient_list):
            recipe_dict ={
                'title' : ingredients[0],
                'ingredients' : ingredients[1:],
                'cooking time' : cooking_time
            }
            filtered_recipes.append(recipe_dict)

    # print(filtered_recipes)
    return filtered_recipes


@app.route('/supermarket')
def find_nearby_supermarket():
    user_lat, user_lon = get_user_location()
    if user_lat is not None and user_lon is not None:
        place_type = "supermarket"
        search_radius = 10
        p=find_nearby_places(float(user_lat), float(user_lon), place_type, search_radius)
        supermarkets=[]
        for i in range(len(p)):
            smrkt={
                "address":p[i][0],
                "distance":p[i][1]
            }
            supermarkets.append(smrkt)
        supermarket = json.dumps(supermarkets,indent=0)
        return jsonify({'Supermarkets':supermarket}) 
    else:
        return jsonify({'error': 'no supermarkets found!'})

if __name__ == '__main__':
    app.run(debug=True)
