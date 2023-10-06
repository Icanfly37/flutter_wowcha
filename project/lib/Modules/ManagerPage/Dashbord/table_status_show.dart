import 'package:flutter/material.dart';
import 'package:ku_t/Models/status_db.dart';
import 'package:ku_t/Modules/Component/CustomDataTable.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Services/apiconnector/callapt.dart';
// import 'Modules/Home/Home_View.dart';
// import 'Services/firebase.dart';
// import 'Services/apiconnector/callapt.dart';
//
class Table_status extends StatefulWidget {
  const Table_status({super.key});

  @override
  State<Table_status> createState() => _Table_status_State();
}

class _Table_status_State extends State<Table_status> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // hintColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: FutureBuilder<void>(
        future: send_status_db({"collection":"เปิดการสอน"}), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
             if (send_status_db({"collection":"เปิดการสอน"}) == true){
                return _foundCourse();
             }
             else{
               return _notFoundCourse();
             }
          } else {
            return _notFoundCourse();
          }
        },
      ),
    );
  }
  Container _foundCourse() {
    return Container(
      // width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: const EdgeInsets.only(top: 2),
              child: CustomDataTable(
                  borderRadius: 10.0,
                  columns: [
                    DataColumn(
                        label: Text(
                      'ลำดับ',
                      style: textStylehintbold(),
                    )),
                    DataColumn(
                        label: Text(
                      'รหัสวิชา',
                      style: textStylehintbold(),
                    )),
                    DataColumn(
                        label: Text(
                      'ชื่อรายวิชา',
                      style: textStylehintbold(),
                    )),
                    DataColumn(
                        label: Text(
                      'หน่วยกิต',
                      style: textStylehintbold(),
                    )),
                    DataColumn(
                        label: Text(
                      'วิชาพื้นฐาน',
                      style: textStylehintbold(),
                    )),
                    DataColumn(
                        label: Text(
                      'จัดการข้อมูล',
                      style: textStylehintbold(),
                    )),
                  ],
                  rows: List.generate(
                      10, // กำหนดให้ตารางขึ้น 10 rows
                      (index) => DataRow(
                            color: MaterialStateColor.resolveWith((states) {
                              // กำหนดสีแต่ละแถวตาม index
                              if (index % 2 == 0) {
                                return Colors.white; // สีขาวสลับกับสีเขียวอ่อน
                              } else {
                                return Color.fromRGBO(240, 249, 241, 1);
                              }
                            }),
                            cells: [
                              DataCell(Text('ข้อมูล ${index + 1}')),
                              DataCell(Text('ข้อมูล ${index + 1}')),
                              DataCell(Text('ข้อมูล ${index + 1}')),
                              DataCell(Text('ข้อมูล ${index + 1}')),
                              DataCell(Text('ข้อมูล ${index + 1}')),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        size: 18,
                                        color: Color.fromRGBO(114, 114, 114, 1),
                                      ),
                                      // iconSize: 10,
                                      onPressed: () {
                                        // แก้ไขข้อมูล
                                        print('แก้ไขแถวที่ $index');
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        size: 18,
                                        color: Color.fromRGBO(114, 114, 114, 1),
                                      ),
                                      // iconSize: 10,
                                      onPressed: () {
                                        // แสดง PopUp ลบข้อมูล
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              // title: Text('ตัวอย่าง Popup'),
                                              content: Text(
                                                  'ต้องการลบรายวิชาหรือไม่?'),
                                              actions: <Widget>[
                                                Container(
                                                  width: 100,
                                                  height: 40,
                                                  // alignment: Alignment.topLeft,
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color:
                                                          const Color.fromRGBO(
                                                              0, 102, 94, 1)),
                                                  child: TextButton(
                                                    child: Text(
                                                      'ยืนยัน',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  width: 100,
                                                  height: 40,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 8,
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color
                                                            .fromRGBO(
                                                            255, 93, 93, 1),
                                                        width: 2.5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    // color: Color.fromRGBO(0, 102, 94, 1)
                                                  ),
                                                  child: TextButton(
                                                    child: Text(
                                                      'ยกเลิก',
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              255, 93, 93, 1),
                                                          fontSize: 14),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        );
                                        print('ลบแถวที่ $index');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )))),
          // ส่วนปุ่มกดเปลี่ยนหน้าของตาราง
          Container(
            padding: const EdgeInsets.only(top: 4),
            // alignment: Alignment.topRight,
            // mainAxisAlignment: MainAxisAlignment.end,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    "หน้า",
                    style: TextStyle(
                      fontSize: 14,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "2",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "3",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Container _notFoundCourse() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 2),
      height: orientation == Orientation.portrait ? 250 : 460,
      decoration: decorationbordergray(),
      child: Center(
        child: Text(
          'ไม่พบโครงสร้างหลักสูตร!',
          style: textStylegray(),
        ),
      ),
    );
  }
}

// Supakij comment
// receive