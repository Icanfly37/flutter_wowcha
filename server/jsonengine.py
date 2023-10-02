from json import *

class IsJson():
    def __init__(self,path):
        self.path = path
        self.error = 0
    def get_json_file(self,rw):
        if rw == "read" or rw == "READ" or rw == "Read" or rw == "r":
            try:
                self.file_import = open(self.path, 'r',encoding="utf-8")
            except FileNotFoundError:
                return self.error
            else:
                self.error+=1
                return self.error
        elif rw == "write" or rw == "WRITE" or rw == "Write" or rw == "w":
            try:
                self.file_export = open(self.path, 'w',encoding="utf-8")
            except FileNotFoundError:
                return self.error
            else:
                self.error+=1
                return self.error
        else:
            print("Nothing to open")
    def read_json_file(self):
        return load(self.file_import)
    def write_json_file(self,json_data):
        dump(json_data, self.file_export,ensure_ascii=False,indent=4)
    def closefile(self,rw):
        if rw == "read" or rw == "READ" or rw == "Read" or rw == "r":
            self.file_import.close()
        elif rw == "write" or rw == "WRITE" or rw == "Write" or rw == "w":
            self.file_export.close()
        else:
            print("Nothing to close")