import 'package:ku_t/Services/apiconnector/callapt.dart';

class ViewModel {
  Future<bool> get_status() async {
    bool status = await send_status_db({"collection": "เปิดรายวิชา"});
    return status;
  }
}
