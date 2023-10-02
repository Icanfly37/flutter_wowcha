import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import os

def get_Current_Path(file_target):
    current_directory = os.getcwd()
    port_path = current_directory.replace("\\", "/")
    real_path = port_path+file_target
    #real_path = file_path.replace("\\", "/")
    return real_path

# Set up
# cred = credentials.Certificate("C:/Users/Supakij/Documents/GitHub/testbase_back-end/backend/serviceAccountKey.json")
cred = credentials.Certificate(get_Current_Path("/backend/database/serviceAccountKey.json"))
firebase_admin.initialize_app(cred)

db = firestore.client()

# Add a document to the collection
# Replace "my-collection" with the desired collection name
data = ({'basicsubject':'test','coursecode':533433,'coursename':'null','credit':'null','teachername':'null','test':'test'})
db.collection('Subject test').add(data)

# Close the Firebase Admin SDK when done
firebase_admin.delete_app(firebase_admin.get_app())