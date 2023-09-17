import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# Set up
cred = credentials.Certificate("C:/Users/Supakij/Documents/GitHub/testbase_back-end/backend/serviceAccountKey.json")
firebase_admin.initialize_app(cred)

db = firestore.client()

# Add collection and documents
data = ({'basicsubject':'test','coursecode':533433,'coursename':'null','credit':'null','teachername':'null','test':'test'})
db.collection('Subject test').add(data)