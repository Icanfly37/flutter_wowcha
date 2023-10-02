import 'package:ku_t/Services/apiconnector/callapt.dart';

class ViewModel {
  bool status = false;
  Future<bool> get_status() async {
    status = await send_status_db({"collection": "เปิดการสอน"});
    return status;
  }
}