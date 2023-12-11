import requests

url = 'http://127.0.0.1:5000/predict'
# Replace with the actual paths to your image files
file_paths = ["C:/Users/viruj/Downloads/apple.jpg", "C:/Users/viruj/Downloads/carrot.jpg", "C:/Users/viruj/Downloads/apple.jpg"]

# Create a dictionary of files with the same field name 'file'
files = [('file', (f, open(f, 'rb'))) for f in file_paths]

try:
    response = requests.post(url, files=files)
    print(response.json())
except Exception as e:
    print(f"Error: {e}")
