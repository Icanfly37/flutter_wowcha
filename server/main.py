from typing import Annotated, Union
from fastapi import FastAPI, UploadFile,File
from fastapi.responses import FileResponse
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from Excel.ExcelEngine import *
from openpyxl import *
from io import *
from jsonengine import *
import os
from work import *

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def read_root():
    #subject = OnJson(get_file_path("\Total_course.json"),"r",)
    return {"message": "Hello World"}

#get status data
@app.post("/detect_collection")
def read_item(target:dict):
    name = target["collection"]
    status = get_status(get_file_path("\database\serviceAccountKey.json"),name)
    print(status)
    return {"status" : status}

#stub/driver
@app.post("/test_send")
def read_root():
    send = OnJson(get_Current_Path("data.json"),"r")
    return {"getjson": send}

#getdata
@app.post("/update/")
async def update_item(data: dict):
    #print(data)
    keys = list(data.keys())
    if keys[0] == "Update_Subject":
        print("update")
        update_subject(data[keys[0]])
    #print(item.description)
    elif keys[0] == "Update_Course":
        print("Update_Course")
        print(data[keys[0]])
        #update_course(data[keys[0]])
    return {"message": "Data received and processed successfully"}

#getExcelFile
@app.post("/downloadfiles/")
async def create_file(file: Annotated[bytes, File()]):
    rows = OnExcel(file,("รายวิชา","เปิดการสอน"))
    #rows = OnExcel(file)
    #print(rows)
    return {"rows":rows}

#sendExcelFile
@app.post("/uploadfile/")
def upload_file():
    excel_send = "D:/excel_test/ontester.xlsx"
    return FileResponse(excel_send, media_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')

#get_status when finish import
@app.post("/status_import")
async def status_import():
    send = reset_status()
    print(send)
    return {"status":send}
    