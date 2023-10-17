from Excel.ExcelEngine import *
from jsonengine import *
import os
from database.DB_Engine import *
from io import *
from Excel.rows_and_cols import *

finish_import = False

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

def add_field_db(cred,collection_name,doc,data):
    db = Database(cred)
    db.get_db()
    db.get_collection(collection_name)
    db.create_doc(data,doc)
    db.close_db()

def get_status(cred,collection):   
    db = Database(cred)
    db.get_db()
    status = db.check_exist_collection(collection)#check_exist_collection(self,collection_target) 
    db.close_db()
    return status

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
    global finish_import
    finish_import = True
    OnJson(get_file_path("\last_status.json"),'w',{"last_id":rows[1]})
    
    global all_subject
    OnJson(get_file_path("\Total_Course.json"),'w',all_subject)
    all_subject.clear()
    
    return rows[1]

def reset_status():
    global finish_import
    send = finish_import
    finish_import = False
    return send

def update_subject(data):
    subject = {}
    course = {}
    
    Current_Subject = OnJson(get_file_path("\Total_Course.json"),"r") #new
    
    data["ปีการศึกษา"] = data['รหัสวิชา'][-2:]
    data['รหัสวิชา'] = data['รหัสวิชา'][:8]
    for key,value in data.items():
        if key == "อาจารย์ผู้สอน":
            course["P_ID"] = value
        else:
            subject[key] = value
    last_status = list(OnJson(get_file_path("\last_status.json"),'r').values())
    last_status[0]+=1
    course["S_ID"] = "Subject_"+str(last_status[0])
    
    Current_Subject[data['รหัสวิชา']] = course["S_ID"] #new
    
    add_field_db(get_file_path("\database\serviceAccountKey.json"),
        "รายวิชา",
        "Subject_"+str(last_status[0]),
        subject
    )
    add_field_db(get_file_path("\database\serviceAccountKey.json"),
        "เปิดการสอน",
        "Course_"+str(last_status[0]),
        course
    )
    
    OnJson(get_file_path("\last_status.json"),'w',{"last_id":last_status[0]})
    
    OnJson(get_file_path("\Total_Course.json"),'w',Current_Subject) #new
    
def test(Collection):
    FetchAD = Database(get_file_path("\database\serviceAccountKey.json")) 
    FetchAD.get_db()
    if Collection == "รายวิชา":
        key = "Subject_"
        for i in 10:
            if i < 10:
                key = key + "0" + i
                print(FetchAD.read_field(key))
    Item = FetchAD.get_all_data(Collection) 
    FetchAD.close_db()
    return Item
print(test("รายวิชา"))

# path = "D:/หลักสูตร.xlsx"
# #OnExcel(path,("รายวิชา","เปิดการสอน"))
# OnExcel(path)
# rows = OnExcel(path)
# a=get_intel()
# print(a[0])
# OnJson("รายวิชา.json","w",a[0])
# OnJson("เปิดการสอน.json","w",a[1])
# print(a[1])
# print("------------------------------------------")
# print(clear_list())
