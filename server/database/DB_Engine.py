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

class Database():
    def __init__(self,path):
        self.path = path
    def get_db(self):
        self.cred = credentials.Certificate(self.path)
        firebase_admin.initialize_app(self.cred)
        self.db = firestore.client()
    def get_collection(self,collection): #if exist, use it, otherwise new collection
        self.collection = self.db.collection(collection)
    def get_all_data(self,collection):
        result = self.collection(collection).stream()
        return result.to_dict()
    def create_doc(self,data,doc = None): #use for new document only
        if doc is not None:
            self.collection.document(doc).set(data)
        else:
            self.collection.add(data)
    def read_field(self,doc):
        result = self.collection.document(doc).get()
        if result.exists:
            #print(result.to_dict())
            return result.to_dict()
        else:
            return None
    def update_db(self,document,data):
        self.collection.document(document).update(data)
    def delete_field(self,document,field_name):
        self.collection.document(document).update({
            field_name:firestore.DELETE_FIELD
        })
    def delete_document(self,document):
        self.collection.document(document).delete()
    def delete_all_document(self):
        all_document = self.collection.stream()
        for i in all_document:
            i.reference.delete()
    def close_db(self):
        firebase_admin.delete_app(firebase_admin.get_app())
    def check_exist_collection(self,collection_target):
        collections = self.db.collections()
        # Check if the target collection exists
        for coll_ref in collections:
            if coll_ref.id == collection_target:
                return True
        return False


# #Initialize database
# db = Database(get_Current_Path("/backend/database/serviceAccountKey.json"))

# #test Create Database
# data = {'basicsubject':'Wow',
#          'coursecode':4442,
#          'coursename':'null',
#          'credit':'null',
#          'teachername':'null',
#          'test':'test'}
# ##test in existing collection
# collection1 = 'TestDB'
# collection2 = "TestDelete"
# doc = "testdoc"
# # new_data = {"Pre": None,
# #             "teachername": "AKA"
# #             }
# db.get_db()
# db.get_collection(collection2) #if collection is exist, use it, otherwise new collection
# #db.create_doc(data,doc)
# #db.update_db(doc,new_data)
# #output = db.read_field(doc)
# #print(output)
# #db.delete_field(doc,"Pre")
# #db.delete_document(doc)
# #close database
# db.close_db()