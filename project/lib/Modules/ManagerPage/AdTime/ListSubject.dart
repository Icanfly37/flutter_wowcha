
import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/ManagerPage/AdTime/PopUp_Addtime.dart';
import 'package:ku_t/Modules/ManagerPage/AdTime/value_for_time.dart';

class Addtime extends StatefulWidget {
  const Addtime({Key? key}) : super(key: key);

  @override
  State<Addtime> createState() => _AddtimeState();
}

class _AddtimeState extends State<Addtime> {

  Variable _variable = Variable();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: null,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
                decoration: decorationadd(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      child: Text(/*"รหัสวิชา"*/_variable.course_code,
                      style: textStylehintbold(),),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(/*"ชื่อวิชา"*/_variable.course_name,
                          style: textStylehintbold(),),
                          Text(/*'3'*/_variable.credit_value + ' หน่วยกิต',
                          style: textStylehint(),
                          ),
                          Row(
                            children: [
                              Text('อาจารย์ผู้สอน ',
                              style: textStylehintbold(),),
                              Text(/*"ชื่ออาจารย์"*/_variable.teacher_name,
                              style: textStylehint(),
                              ),
                            ],
                          ),
                          Text(
                            /*'ชั้นปีที่มีสิทธิ์'*/_variable.student_year,
                            style: textStylehintbold(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: decorationgreen(),
                          child: TextButton(
                            onPressed: () {
                              openDialog();
                            },
                            child: Text('เลือกรายวิชา', style: textStylewhite()),
                          )),
                    )
                  ],
                ),
              );
            },
          );
      },
    );
    
  }

  Future openDialog() => showDialog(
      context: context,
      
      builder: (context) => const Dialog(child: HomeScreen(taskId: '')));
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/ManagerPage/Teachingtime/PopUp_Addtime.dart';

// import '../../Component/Header_web.dart';

class Addtime extends StatefulWidget {
  const Addtime({Key? key}) : super(key: key);

  @override
  State<Addtime> createState() => _AddtimeState();
}

class _AddtimeState extends State<Addtime> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: null,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
                decoration: decorationadd(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      child: Text("รหัสวิชา",
                      style: textStylehintbold(),),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ชื่อวิชา",
                          style: textStylehintbold(),),
                          Text('3' + ' หน่วยกิต',
                          style: textStylehint(),
                          ),
                          Row(
                            children: [
                              Text('อาจารย์ผู้สอน ',
                              style: textStylehintbold(),),
                              Text("ชื่ออาจารย์",
                              style: textStylehint(),
                              ),
                            ],
                          ),
                          Text(
                            'ชั้นปีที่มีสิทธิ์',
                            style: textStylehintbold(),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: decorationgreen(),
                          child: TextButton(
                            onPressed: () {
                              openDialog();
                            },
                            child: Text('เลือกรายวิชา', style: textStylewhite()),
                          )),
                    )
                  ],
                ),
              );
            },
          );
      },
    );
    
  }

  Future openDialog() => showDialog(
      context: context,
      
      builder: (context) => const Dialog(child: HomeScreen(taskId: '')));
}
