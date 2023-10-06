import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/ManagerPage/Teachingtime/PopUp.dart';

// import '../../Component/Header_web.dart';

class Addtime extends StatefulWidget {
  const Addtime({Key? key}) : super(key: key);

  @override
  State<Addtime> createState() => _AddtimeState();
}

class _AddtimeState extends State<Addtime> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          // itemCount: docs.length,
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
                    flex: 7,
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
    
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => const Dialog(child: HomeScreen()));
}
