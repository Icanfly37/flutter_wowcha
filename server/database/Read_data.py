import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# Set up
cred = credentials.Certificate("D:/testbase_back-end/backend/serviceAccountKey.json")
firebase_admin.initialize_app(cred)

db = firestore.client()

# Read data
# Getting a document with a know ID
result = db.collection('Subject test').document("p2i6CEkU1cXiZBDO09be").get()
if result.exists:
    print(result.to_dict())
    
# Get all documents in a collection
# docs = db.collection('Subject test').get()
# for doc in docs:
#     print(doc.to_dict())