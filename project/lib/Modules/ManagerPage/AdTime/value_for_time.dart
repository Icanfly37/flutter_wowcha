import 'package:flutter/foundation.dart';

class Variable {
  String course_code = "03603341-60"; //Subject_42
  String course_name = "Software Engineering";
  String credit_value = "4"; //หน่วยกิต(เอาแค่จำนวนหน่วยกิจ)
  String teacher_name = "name";
  String student_year = "T12(x)";

  //
  String day = 'Day';
  String time = '00:00 - 00:00';
  String sec = 'sec';
  String quantity = 'xxx';
  String room = 'room';
}

class Require_Data {
  String? studygroup;
  String? numberopen;
  String? room;
  String? daysvalue;
  String? timeStartvalue;
  String? timeEndvalue;
  String? checkbox1;
  String? checkbox2;
  String? checkbox3;
  String? checkbox4;

  Require_Data({
    this.studygroup,
    this.numberopen,
    this.room,
    this.daysvalue,
    this.timeStartvalue,
    this.timeEndvalue,
    this.checkbox1,
    this.checkbox2,
    this.checkbox3,
    this.checkbox4,
  });

  Map<String, dynamic> toMap() {
    return {
      "หมู่เรียน": studygroup,
      "จำนวนที่เปิดรับ": numberopen,
      "ห้องเรียน": room,
      "วันเปิดสอน": daysvalue,
      "เวลาเริ่มต้น": timeStartvalue,
      "เวลาสิ้นสุด": timeEndvalue,
      "ชั้นปี 1": checkbox1,
      "ชั้นปี 2": checkbox2,
      "ชั้นปี 3": checkbox3,
      "ชั้นปี 4": checkbox4,
    };
  }
}

class Operator {
  Map<String, dynamic> all_data = {};
  List<Require_Data> collecter = [];
  List<dynamic> element = [];
  void combind_to_list(Map<String, dynamic> teacher) {
    collecter.forEach((data) {
      //all_data[_variable.course_code] = data.toMap();
      element.add(data.toMap());
    });
    element.add(teacher);
  }

  void all_clear() {
    collecter.clear();
    element.clear();
    all_data.clear();
  }
}
