import 'package:flutter/foundation.dart';

class Variable{
  String course_code = "รหัสวิชา";
  String course_name = "ชื่อวิชา";
  String credit_value = "3"; //หน่วยกิต(เอาแค่จำนวนหน่วยกิจ)
  String teacher_name = "ชื่ออาจารย์";
  String student_year = "T12(1)";
}

class Operator{
  Map <String,dynamic> sub_data = {},all_data = {};
  List<dynamic> data = [];

  void add_to_sub(String key,dynamic value){
    sub_data[key] = value;
  }

  void clear_sub(){
    sub_data.clear();
  }

  void group_to_data(dynamic value){
    data.add(value);
  }

  void add_to_all(String key,dynamic value){
    all_data[key] = value;
  }
}