import 'package:flutter/material.dart';
import 'package:ku_t/Services/apiconnector/callapt.dart';

class ViewModel {
  bool status = false;
  bool now_import = false;
  bool set_update = false;
  Map<String,dynamic> update_data = {};
  Future<void> get_status() async {
    status = await send_status_db({"collection": "รายวิชา"});
  }
  Future<bool> Is_Import() async {
    now_import = await imported();
    return now_import;
  }
  void adddata(String key,dynamic value){
    update_data[key] = value;
  }
  
}