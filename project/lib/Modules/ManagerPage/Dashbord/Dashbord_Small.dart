//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Componemt/CustomDataTable.dart';
import 'package:ku_t/Modules/ManagerPage/Dashbord/PopUp.dart';

class DashbordSmall extends StatefulWidget {
  const DashbordSmall({super.key});

  @override
  State<DashbordSmall> createState() => _DashbordSmallState();
}

class _DashbordSmallState extends State<DashbordSmall> {
  // CollectionReference addsubject =
  //     FirebaseFirestore.instance.collection('subject');
  late TextEditingController controller;
  String? selectedValue; //N
  bool isImport =
      false; // ถ้า false จะเป็นไม่พบหลักสูตร ถ้า true คือมีข้อมูลหลักสูตรแล้ว (ข้อมูลจะขึ้นในตาราง)

  //TextEditingController coursecodeC = TextEditingController(); //y
  //TextEditingController coursenameC = TextEditingController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          _header(),
          const Divider(height: 26),
          Container(
              child: orientation == Orientation.portrait //short if/else
                  ? Column(
                      //is if
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _textyear(),
                            const SizedBox(height: 4),
                            _DropdownSelectYear(),
                            const SizedBox(height: 10),
                            _textSearchSubject(),
                            const SizedBox(height: 4),
                            _SearchSubject(),
                            const SizedBox(height: 18),
                            _ButtonAdd(),
                            const SizedBox(height: 10),
                            _ButtonImportCourse()
                          ],
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _textyear(),
                            const SizedBox(height: 4),
                            _DropdownSelectYear(),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _textSearchSubject(),
                              const SizedBox(height: 4),
                              _SearchSubject(),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(top: 25),
                          child: Row(
                            children: [
                              const Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                      // height: 101,
                                      )),
                              Expanded(child: _ButtonAdd()),
                              const SizedBox(width: 12),
                              Expanded(child: _ButtonImportCourse())
                            ],
                          ),
                        ))
                      ],
                    )),
          Container(
            child: _textCourseStructure(),
          ),

          Container(
              child: isImport
                  ? _foundCourse()
                  : _notFoundCourse()), // เงื่อนไขในการขึ้นตารางข้อมูลหลักสูตร (?จะขึ้นตาราง และ :จะขึ้นไม่พบหลักสูตร)
        ],
      ),
    );
  }

  Container _header() {
    return Container(
      alignment: Alignment.topLeft,
      child: const Text(
        "การจัดการข้อมูลหลักสูตร",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }

  Container _textyear() {
    return Container(
      alignment: Alignment.topLeft,
      child: const Text(
        "ปีหลักสูตร",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container _DropdownSelectYear() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      // width: MediaQuery.of(context).size.width,
      width: orientation == Orientation.portrait ? double.infinity : 100,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(230, 230, 230, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton<String?>(
        hint: const Text(
          "เลือก",
          // style: textStylehint()
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        dropdownColor: Colors.white,
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        underline: const SizedBox(),
        isExpanded: true,
        style: const TextStyle(fontSize: 14),
        items: [
          "2550",
          "2555",
          "2560",
          "2565",
          "2570",
        ].map<DropdownMenuItem<String?>>((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e.toString()),
          );
        }).toList(),
      ),
    );
  }

  Container _textSearchSubject() {
    return Container(
      alignment: Alignment.topLeft,
      child: const Text(
        "ค้นหารายวิชา",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Column _SearchSubject() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            //ช่องใส่รหัส/วิชา
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                // width: 300,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(230, 230, 230, 1),
                    borderRadius: BorderRadius.circular(15)),
                child: const TextField(
                  cursorColor: Color.fromRGBO(172, 173, 191, 1),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 14),
                    hintText: "รหัสวิชา / ชื่อรายวิชา",
                    // hintStyle: textStyle16(),
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 80,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(0, 102, 94, 1)),
                  child: TextButton(
                    onPressed: () {
                      print("hit!");
                    },
                    child: const Text(
                      'ค้นหา',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Container _ButtonImportCourse() {
    return Container(
      // margin: EdgeInsets.only(top: 27),
      width: MediaQuery.of(context).size.width,
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        border:
            Border.all(color: const Color.fromRGBO(0, 102, 94, 1), width: 2.5),
        borderRadius: BorderRadius.circular(15),
        // color: Color.fromRGBO(0, 102, 94, 1)
      ),
      child: TextButton(
        onPressed: () {
          print("นำเข้าหลักสูตร");
          Navigator.pushNamed(context, '/import');
        },
        child: const Text(
          'นำเข้าหลักสูตร',
          style: TextStyle(
              color: Color.fromRGBO(0, 102, 94, 1),
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container _ButtonAdd() {
    return Container(
      // margin: EdgeInsets.only(top: 27),
      width: MediaQuery.of(context).size.width,
      height: 50,
      // width: 100,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(0, 102, 94, 1)),
      child: TextButton(
        onPressed: () {
          openDialog();
        },
        child: const Text(
          'เพิ่มรายวิชา',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }

  Container _textCourseStructure() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 10),
      child: const Text(
        "โครงสร้างรายวิชา",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container _notFoundCourse() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      height: 440,
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromRGBO(157, 157, 157, 1), width: 0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          'ไม่พบโครงสร้างหลักสูตร!',
          style: TextStyle(
            color: Color.fromRGBO(110, 110, 110, 1),
            fontSize: 14,
          ),
        ),
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
              padding: const EdgeInsets.only(top: 4),
              child: CustomDataTable(
                  borderRadius: 10.0,
                  columns: [
                    DataColumn(
                        label: Text(
                      'ลำดับ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: Text(
                      'รหัสวิชา',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: Text(
                      'ชื่อรายวิชา',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: Text(
                      'หน่วยกิต',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: Text(
                      'วิชาพื้นฐาน',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: Text(
                      'จัดการข้อมูล',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                                      icon: Icon(
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
                                      icon: Icon(
                                        Icons.delete,
                                        size: 18,
                                        color: Color.fromRGBO(114, 114, 114, 1),
                                      ),
                                      // iconSize: 10,
                                      onPressed: () {
                                        // ลบข้อมูล
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

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => const Dialog(child: PopupManagerView()));
}
