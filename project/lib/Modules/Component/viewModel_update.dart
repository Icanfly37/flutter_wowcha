import 'package:ku_t/Services/apiconnector/callapt.dart';

class Update_Data{
  Map<String,dynamic> _updater = {};
  Future<void> row_update(List<dynamic> start_data) async{
    _updater["รหัสวิชา"] = start_data[0];
    _updater["ชื่อรายวิชาภาษาอังกฤษ"] = start_data[1];
    _updater["หน่วยกิต"] = start_data[2];
    _updater["วิชาพื้นฐาน"] = start_data[3];
    _updater["ชั้นปีที่เปิดสอน"] = start_data[4];
    updates_data("Edit_Subject",_updater);
  }
}