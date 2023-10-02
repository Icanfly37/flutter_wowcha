import 'package:ku_t/Services/apiconnector/callapt.dart';

class ViewModel {
  Future<String> get_status() async {
    bool status = await send_status_db({"collection": "เปิดการสอน"});
    if (status == true) {
      return "จิง";
    } else {
      return "ไม่จิง";
    }
  }
}
