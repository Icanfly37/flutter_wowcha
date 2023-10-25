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
    current_subject = data['รหัสวิชา']#new
    data["ปีหลักสูตร"] = data['รหัสวิชา'][-2:]
    data['รหัสวิชา'] = data['รหัสวิชา'][:8]
    for key,value in data.items():
        if key == "อาจารย์ผู้สอน":
            course["P_ID"] = value
        else:
            subject[key] = value
    last_status = list(OnJson(get_file_path("\last_status.json"),'r').values())
    last_status[0]+=1
    course["S_ID"] = "Subject_"+str(last_status[0])
    
    Current_Subject[current_subject] = course["S_ID"] #new2
    
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

class for_collect_time_data:
    def __init__(self,sec,count,room,day,t_start,t_end,s_year):
       self.sec = sec
       self.count = count
       self.room = room
       self.day = day
       self.t_start = t_start
       self.t_end = t_end
       self.s_year = s_year
    def to_dict(self):
        onsec = list(self.sec.values())[0] #value
        #keys------------------------------------------
        oncount = list(self.count.keys())[0]
        onroom = list(self.room.keys())[0]
        onday = list(self.day.keys())[0]
        ont_start = list(self.t_start.keys())[0]
        ont_end = list(self.t_end.keys())[0]
        ons_year = list(self.s_year.keys())[0]
        #keys------------------------------------------
        return {onsec:{
            'หมู่เรียน': onsec,
            'จำนวนที่เปิดรับ': self.count[oncount],
            'ห้องเรียน': self.room[onroom],
            'วันเปิดสอน': self.day[onday],
            'เวลาเริ่มต้น': self.t_start[ont_start],
            'เวลาสิ้นสุด':  self.t_end[ont_end],
            'ชั้นปีที่เปิดสอน': self.s_year[ons_year]
        }}
        

class for_year_student:
    def __init__(self,y1,y2,y3,y4):
        self.y1 = y1
        self.y2 = y2
        self.y3 = y3
        self.y4 = y4
    def toList(self):
        l = [self.y1,self.y2,self.y3,self.y4]
        fillter = []
        if self.y1 is None and self.y2 is None and self.y3 is None and self.y4 is None:
            fillter.append(None)
        else:
            for i in l:
                if i is not None:
                    fillter.append(i)
        return fillter


def update_course(data):
    combine_data = {"detail" : {}}
    keep_teacher = {}
    big_buffer = []
    round = 1
    Current_Subject = OnJson(get_file_path("\Total_Course.json"),"r")
    key = list(data.keys())
    #--------------------------------- For access key ---------------------------------------
    # if "-" in key[0]:
    #     code = key[0][:8]
    # else:
    #     code = key[0]
    code = key[0]
    #----------------------------------------------------------------------------------------
    course_code = Current_Subject[code]
    name,id = str(course_code).split("_")
    doc_target = str("Course_"+id)
    #print(doc_target)
    value = data[key[0]]
    #print(value)
    #print({"S_ID":course_code})
    for i in value:
        if "อาจารย์" in list(i.keys())[0]:
            keep_teacher.update({list(i.keys())[0]:i[list(i.keys())[0]]})
        else:
            buffer = []
            for key,value in i.items():
                if "ชั้นปี" in key:
                    buffer.append(value)
                else:
                    big_buffer.append({key:value})
                    # db.update_db(doc_target,{
                    #     key:value
                    # })
            student = for_year_student(buffer[0],buffer[1],buffer[2],buffer[3])
            big_buffer.append({"ชั้นปีที่เปิดสอน":student.toList()})
            converter = for_collect_time_data(
                big_buffer[0],
                big_buffer[1],
                big_buffer[2],
                big_buffer[3],
                big_buffer[4],
                big_buffer[5],
                big_buffer[6],
            )
            #print(converter.to_dict())
            #print(combine_data)
            combine_data["detail"].update(converter.to_dict())
            buffer.clear()
            big_buffer.clear()
            round+=1
            #print("----------------------------------------------")
    #print(keep_teacher)
    combine_data["detail"].update(keep_teacher)
    #print(combine_data)
    db = Database(get_file_path("\database\serviceAccountKey.json"))
    db.get_db()
    db.get_collection("เปิดการสอน")
    db.update_db(doc_target,combine_data)
    #print({"detail":combine_data})
    #print(doc_target)
    #print({"S_ID":course_code})
    db.close_db()
    
def test(Collection):
    FetchAD = Database(get_file_path("\database\serviceAccountKey.json")) 
    FetchAD.get_db()
    FetchAD.get_collection(Collection)
    Item = FetchAD.all_docs()
    # if Collection == "รายวิชา":
    #     key = "Subject_"
    #     for i in 10:
    #         if i < 10:
    #             key = key + "0" + i
    #             print(FetchAD.read_field(key))
    # Item = FetchAD.get_all_data(Collection) 
    FetchAD.close_db()
    return Item
# print(test("รายวิชา"))

def print_to_excel():
    #limiter = list(OnJson(get_file_path("\last_status.json"),'r').values())[0]
    db = Multi_Collection(get_file_path("\database\serviceAccountKey.json"))
    collection_1 = "เปิดการสอน"
    collection_2 = "รายวิชา"
    data1 = db.instance_get_all_docs(collection_1)
    data2 = db.instance_get_all_docs(collection_2)
    db.close_db()
    
    start_row_for_80x = 8
    start_row_for_83x = 8
    start_row_at = 8
    
    writer = header(get_file_path("\\file_export\\file_extract.xlsx"))
    for i in data1:
        for key1,value1 in i.items():
            try:
                item = value1["detail"]
            except KeyError:
                continue
            else:
                target_list = int(key1[7:])-1
                doc = data2[target_list] #dict
                doc_2 = doc["Subject_"+key1[7:]]
                subject_name = doc_2["ชื่อรายวิชาภาษาอังกฤษ"]
                basic_subject = doc_2["วิชาพื้นฐาน"]
                big_credit = doc_2["หน่วยกิต"] #หน่วยกิตใหญ่
                timing = big_credit[big_credit.index("("):big_credit.index(")")+1].replace("(","").replace(")","").split("-") #ชม.เรียน
                real_credit = int(big_credit[:big_credit.index("(")]) #หน่วยกิต
                #print(subject_name) 
                
                writer.insert_data(start_row_at,3,subject_name)
                writer.insert_data(start_row_at,4,big_credit)
                
                if int(timing[0]) != 0: #สำหรับวิชาที่มีทฤษฎี
                    #print("for 80x")
                    #print(timing[0],timing[0])
                    cap_timing_for_80x = (timing[0],timing[0])
                    real_credit -= int(timing[0])
                    if real_credit != 0: #สำหรับวิชาที่มีทฤษฎีและปฏิบัติ
                        #print("for 83x")
                        #print(real_credit,timing[1])
                        cap_timing_for_83x = (real_credit,timing[1])
                    else:
                        cap_timing_for_83x = None
                else: #สำหรับวิชาที่ไม่มีทฤษฎี
                    cap_timing_for_80x = None
                    #print("for 83x")
                    #print(real_credit,timing[1])
                    cap_timing_for_83x = (real_credit,timing[1])
                    
                if doc_2["ปีหลักสูตร"] is not None:
                    subject = doc_2["รหัสวิชา"]+"-"+doc_2["ปีหลักสูตร"][2:]
                    writer.insert_data(start_row_at,1,doc_2["รหัสวิชา"])
                    writer.insert_data(start_row_at,2,subject)
                else:
                    subject = doc_2["รหัสวิชา"]
                    writer.insert_data(start_row_at,1,doc_2["รหัสวิชา"])
                
                #print({subject:item})
                for key2,value2 in item.items():
                    if "80" in key2:
                        #print(key2) #sec
                        
                        # for key3,value3 in value2.items():
                        #     print(key3)
                        #     print(value3)
                        if cap_timing_for_80x is not None:
                            writer.insert_data(start_row_for_80x,5,cap_timing_for_80x[0])
                            writer.insert_data(start_row_for_80x,6,cap_timing_for_80x[1])

                            writer.insert_data(start_row_for_80x,7,key2) #หมู่เรียน
                            writer.insert_data(start_row_for_80x,8,value2["วันเปิดสอน"])
                            writer.insert_data(start_row_for_80x,9,value2["เวลาเริ่มต้น"])
                            writer.insert_data(start_row_for_80x,10,"-")
                            writer.insert_data(start_row_for_80x,11,value2["เวลาสิ้นสุด"])
                            writer.insert_data(start_row_for_80x,12,value2["ห้องเรียน"])
                            
                            year = ""
                            for i in value2["ชั้นปีที่เปิดสอน"]:
                                jer = i[:3]
                                year += i[4:]
                            pack_year = jer+"/"+year[:1]+"-"+year[-1:]
                            writer.insert_data(start_row_for_80x,13,pack_year)
                            
                            writer.insert_data(start_row_for_80x,14,value2["จำนวนที่เปิดรับ"])
                            #print(value2["จำนวนที่เปิดรับ"])
                            #print(value2["ชั้นปีที่เปิดสอน"])
                            #print(value2["วันเปิดสอน"])
                            #print(value2["หมู่เรียน"])
                            #print(value2["ห้องเรียน"])
                            #print(value2["เวลาสิ้นสุด"])
                            #print(value2["เวลาเริ่มต้น"])
                            
                        print(start_row_for_80x)
                        start_row_for_80x+=1
                    elif "83" in key2:
                        #print(key2) #sec
                        
                        # for key3,value3 in value2.items():
                        #     print(key3)
                        #     print(value3)
                        
                        writer.insert_data(start_row_for_83x,15,cap_timing_for_83x[0])
                        writer.insert_data(start_row_for_83x,16,cap_timing_for_83x[1])
                        writer.insert_data(start_row_for_83x,17,key2)
                        writer.insert_data(start_row_for_83x,18,value2["วันเปิดสอน"])
                        writer.insert_data(start_row_for_83x,19,value2["เวลาเริ่มต้น"])
                        writer.insert_data(start_row_for_83x,20,"-")
                        writer.insert_data(start_row_for_83x,21,value2["เวลาสิ้นสุด"])
                        writer.insert_data(start_row_for_83x,22,value2["ห้องเรียน"])
                        
                        year = ""
                        for i in value2["ชั้นปีที่เปิดสอน"]:
                            jer = i[:3]
                            year += i[4:]
                        pack_year = jer+"/"+year[:1]+"-"+year[-1:]
                        writer.insert_data(start_row_for_83x,23,pack_year)
                        
                        writer.insert_data(start_row_for_83x,24,value2["จำนวนที่เปิดรับ"])
                        
                        #print(value2["จำนวนที่เปิดรับ"])
                        #print(value2["ชั้นปีที่เปิดสอน"])
                        #print(value2["วันเปิดสอน"])
                        #print(value2["หมู่เรียน"])
                        #print(value2["ห้องเรียน"])
                        #print(value2["เวลาสิ้นสุด"])
                        #print(value2["เวลาเริ่มต้น"])
                        
                        print(start_row_for_83x)
                        start_row_for_83x+=1
                    else:
                        #print(value2) #อาจารย์ผู้สอน
                        teacher = value2
                        #writer.insert_data(start_row_for_80x,25,value2)
                    #print("-------------------------------------------------------------")
                #writer.insert_data(start_row_for_80x,26,"-")
                
                b_s = ",".join(basic_subject) 
                #writer.insert_data(start_row_for_80x,27,b_s) #วิชาพื้นฐาน
                
                start_row_previous = start_row_at
                if start_row_for_80x < start_row_for_83x:
                    #print(start_row_for_83x)
                    start_row_for_80x = start_row_for_83x
                    start_row_at = start_row_for_80x
                elif start_row_for_80x > start_row_for_83x:
                    #print(start_row_for_80x)
                    start_row_for_83x = start_row_for_80x
                    start_row_at = start_row_for_83x
                else:
                    #print(start_row_for_80x)
                    start_row_for_80x = start_row_for_83x
                    start_row_at = start_row_for_80x
                
                for t in range(start_row_previous,start_row_at):
                    writer.insert_data(t,25,teacher)
                    writer.insert_data(t,26,"-")
                    writer.insert_data(t,27,b_s)
                
    writer.save_file()

# print_to_excel()
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
