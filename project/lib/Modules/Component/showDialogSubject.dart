import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/ManagerPage/AdTime/value_for_time.dart';

class ShowDialogSubject extends StatefulWidget {
  const ShowDialogSubject({super.key});

  @override
  State<ShowDialogSubject> createState() => _ShowDialogSubjectState();
}

class _ShowDialogSubjectState extends State<ShowDialogSubject> {
  Variable _variable = Variable();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: null,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin:
                  const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
              decoration: decorationpop_sub(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _variable.day,
                          style: textStyleDayTime(),
                        ),
                        Text(
                          _variable.time,
                          style: textStyleDayTime(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              /*"รหัสวิชา"*/ _variable.course_code,
                              style: textStyleDBoxSub(),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'หมู่ ',
                              style: textStyleDBoxSub(),
                            ),
                            Text(
                              /*"หมู่เรียน"*/ _variable.sec,
                              style: textStyleDBoxSubAns(),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              /*'3'*/ _variable.credit_value + ' หน่วยกิต',
                              style: textStyleDBoxSub(),
                            ),
                          ],
                        ),
                        Text(
                          /*"ชื่อวิชา"*/ _variable.course_name,
                          style: textStyleDBoxSub(),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'จำนวนที่เปิดรับ ',
                                      style: textStyleDBoxSub(),
                                    ),
                                    Text(
                                      /*"จำนวนที่เปิดรับ"*/ _variable.quantity,
                                      style: textStyleDBoxSubAns(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'อาจารย์ผู้สอน ',
                                      style: textStyleDBoxSub(),
                                    ),
                                    Text(
                                      /*"ชื่ออาจารย์"*/ _variable.teacher_name,
                                      style: textStyleDBoxSubAns(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(width: 150),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'ห้อง ',
                                      style: textStyleDBoxSub(),
                                    ),
                                    Text(
                                      /*"ห้อง"*/ _variable.room,
                                      style: textStyleDBoxSubAns(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'ชั้นปีที่มีสิทธ์ ',
                                      style: textStyleDBoxSub(),
                                    ),
                                    Text(
                                      /*"ชั้นปีที่มีสิทธิ์"*/ _variable
                                          .student_year,
                                      style: textStyleDBoxSubAns(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
