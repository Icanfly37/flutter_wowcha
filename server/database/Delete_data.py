import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# Set up
cred = credentials.Certificate("C:/Users/Supakij/Documents/GitHub/testbase_back-end/backend/serviceAccountKey.json")
firebase_admin.initialize_app(cred)

db = firestore.client()

# Delete data know ID document
# db.collection('Subject test').document('Dr0J6l7NhjnGLnkIJZsY').delete()

# Delete data known ID field
db.collection('Subject test').document('Dr0J6l7NhjnGLnkIJZsY').update({"basicsubject":firestore.DELETE_FIELD})