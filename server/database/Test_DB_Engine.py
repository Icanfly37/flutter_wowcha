from DB_Engine import *

def get_file_path(file_target): #for read
    script_dir = os.path.dirname(os.path.abspath(__file__))+file_target
    return script_dir
# print(get_file_path("\serviceAccountKey.json"))
db = Database(get_file_path("\serviceAccountKey.json"))

# Example Read
db.get_db()
db.get_collection("รายวิชา")
rf = db.read_field("Subject_01")
print(rf)
db.close_db()

# Example Delete
# db.get_db()
# db.get_collection("Subject test")
# a = db.delete_field("testdoc","test")
# print(a)
# db.close_db()