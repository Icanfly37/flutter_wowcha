from Excel.ExcelEngine import *
from jsonengine import *
import os
from database.DB_Engine import *
from io import *
from Excel.rows_and_cols import *

def get_Current_Path(file_target): #for write
    current_directory = os.getcwd()
    port_path = current_directory.replace("\\", "/")
    real_path = port_path+file_target
    return str(real_path)

def get_file_path(file_target): #for read
    script_dir = os.path.dirname(os.path.abspath(__file__))+file_target
    return script_dir

def OnJson(path,rw,target = None):
    jsoner = IsJson(path)
    jsoner.get_json_file(rw)
    if rw == "write" or rw == "WRITE" or rw == "Write" or rw == "w" and target is not None:
        jsoner.write_json_file(target)
        jsoner.closefile(rw)
    elif rw == "read" or rw == "READ" or rw == "Read" or rw == "r":
        send = jsoner.read_json_file()
        jsoner.closefile(rw)
        return send
    else:
        jsoner.closefile(rw)
        return None
    
def OnDB_C(cred,collection_name,target,onnow):
    db = Database(cred)
    db.get_db()
    db.get_collection(collection_name)
    #id = head
    for i in target:
        if onnow == 0:
            id = i.get("S_ID")
            i.pop("S_ID")
        else:
            id = i.get("C_ID")
            i.pop("C_ID")
        db.create_doc(i,str(id))
        #id += 1
    db.close_db()
    

def OnExcel(file,db_collection=None):
    ExcelOP = Excel(BytesIO(file))
    #ExcelOP = Excel(file)
    ExcelOP.openfile()
    rows = ExcelOP.getrows() #for input to database from excel
    #OnJson("data.json","w",rows)
    pack_for_db=get_intel() #subject = 0,course = 1
    ExcelOP.closefile()
    if db_collection is not None:
        for i in range(len(db_collection)):     
            OnDB_C(get_file_path("\database\serviceAccountKey.json"),db_collection[i],pack_for_db[i],i)
    clear_list()
    return rows

#path = "D:/หลักสูตร.xlsx"
#OnExcel(path,("รายวิชา","เปิดการสอน"))
#rows = OnExcel(path)
#a=get_intel()
#print(a[0])
#OnJson("รายวิชา.json","w",a[0])
#OnJson("เปิดการสอน.json","w",a[1])
#print(a[1])
#print("------------------------------------------")
#print(clear_list())
