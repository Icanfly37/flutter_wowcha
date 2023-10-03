import 'package:flutter/material.dart';
import 'package:ku_t/Services/apiconnector/callapt.dart';

class ViewModel {
  bool status = false;
  bool now_import = false;
  Future<bool> get_status() async {
    status = await send_status_db({"collection": "เปิดการสอน"});
    return status;
  }
  Future<bool> Is_Import() async {
    now_import = await imported();
    return now_import;
  }
  
}