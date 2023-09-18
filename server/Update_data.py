import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# Set up
cred = credentials.Certificate("C:/Users/Supakij/Documents/GitHub/testbase_back-end/backend/serviceAccountKey.json")
firebase_admin.initialize_app(cred)

db = firestore.client()

# Update data known key
db.collection('Subject test').document('Dr0J6l7NhjnGLnkIJZsY').update({"basicsubject":"test123"})
db.collection('Subject test').document('Dr0J6l7NhjnGLnkIJZsY').update({"coursecode":"98432"})