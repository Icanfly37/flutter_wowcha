import 'package:flutter/material.dart';
// import 'package:unicons/unicons.dart';

class ProcessImportCourse extends StatefulWidget {
  const ProcessImportCourse({super.key});

  @override
  State<ProcessImportCourse> createState() => _ProcessImportCourseState();
}

class _ProcessImportCourseState extends State<ProcessImportCourse> {
  late TextEditingController controller;
  String? selectedValue; //N
  // bool isImport =
  //     false;

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
          _headerImportCourse(),
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
                            const SizedBox(height: 18),
                            _ButtonImportCourse(),
                            const SizedBox(height: 10),
                            _ButtonCancel()
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
                            child: Container(
                          padding: EdgeInsets.only(top: 25),
                          child: Row(
                            children: [
                              const Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                      // height: 101,
                                      )),
                              Expanded(child: _ButtonImportCourse()),
                              const SizedBox(width: 12),
                              Expanded(child: _ButtonCancel())
                            ],
                          ),
                        ))
                      ],
                    )),
          // Container(
          //   child: _textCourseStructure(),
          // ),
          const SizedBox(height: 15),
          Container(child: _TableCourseData()),
          // if (isImport==true) {
          //   Container(child: _foundCourse()),
          // }
          // Container(
          //     child: isImport
          //         ? _foundCourse()
          //         : _notFoundCourse()), // เงื่อนไขในการขึ้นตารางข้อมูลหลักสูตร
        ],
      ),
    );
  }

  Container _headerImportCourse() {
    return Container(
      alignment: Alignment.topLeft,
      child: const Text(
        "การนำเข้าข้อมูลหลักสูตร",
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
        ),
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

  // ignore: non_constant_identifier_names
  Container _ButtonImportCourse() {
    return Container(
      // margin: EdgeInsets.only(top: 27),
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(0, 102, 94, 1)),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'นำเข้าหลักสูตร',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }

  Container _ButtonCancel() {
    return Container(
      // margin: EdgeInsets.only(top: 27),
      width: MediaQuery.of(context).size.width,
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        border:
            Border.all(color: const Color.fromRGBO(255, 93, 93, 1), width: 2.5),
        borderRadius: BorderRadius.circular(15),
        // color: Color.fromRGBO(0, 102, 94, 1)
      ),
      child: TextButton(
        onPressed: () {
          // print('เจ๋งแจ๋ว');
          print("นำเข้าหลักสูตร");
          Navigator.pop(context, '/importcourse');
        },
        child: const Text(
          'ยกเลิก',
          style: TextStyle(
              color: Color.fromRGBO(255, 93, 93, 1),
              fontWeight: FontWeight.bold,
              fontSize: 14),
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
          fontSize: 6,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container _TableCourseData() {
    return Container(
      // width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: const EdgeInsets.only(top: 10),
              child: DataTable(
                  dataRowHeight: 40,
                  headingRowHeight: 40,
                  headingRowColor: MaterialStateProperty.resolveWith(
                    (states) => const Color.fromRGBO(
                        227, 227, 227, 1), // สีของ headingRow
                  ),
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
                    // DataColumn(
                    //     label: Text(
                    //   'จัดการข้อมูล',
                    //   style:
                    //       TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    // )),
                  ],
                  rows: List.generate(
                      10, // กำหนดให้ตารางขึ้น 10 rows
                      (index) => DataRow(
                            color: MaterialStateColor.resolveWith((states) {
                              // กำหนดสีแต่ละแถวตาม index
                              if (index % 2 == 0) {
                                return Colors.white; // สีขาวสลับกับสีเทา
                              } else {
                                return Color.fromRGBO(246, 246, 246, 1);
                              }
                            }),
                            cells: [
                              DataCell(Text('ข้อมูล ${index + 1}')),
                              DataCell(Text('ข้อมูล ${index + 1}')),
                              DataCell(Text('ข้อมูล ${index + 1}')),
                              DataCell(Text('ข้อมูล ${index + 1}')),
                              DataCell(Text('ข้อมูล ${index + 1}')),
                              // DataCell(
                              //   Row(
                              //     children: [
                              //       IconButton(
                              //         icon: Icon(
                              //           Icons.edit,
                              //           size: 18,
                              //           color: Color.fromRGBO(114, 114, 114, 1),
                              //         ),
                              //         // iconSize: 10,
                              //         onPressed: () {
                              //           // แก้ไขข้อมูล
                              //           print('แก้ไขแถวที่ $index');
                              //         },
                              //       ),
                              //       IconButton(
                              //         icon: Icon(
                              //           Icons.delete,
                              //           size: 18,
                              //           color: Color.fromRGBO(114, 114, 114, 1),
                              //         ),
                              //         // iconSize: 10,
                              //         onPressed: () {
                              //           // ลบข้อมูล
                              //           print('ลบแถวที่ $index');
                              //         },
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          )))),
          // ส่วนปุ่มกดเปลี่ยนหน้าของตาราง
          Container(
            padding: const EdgeInsets.only(top: 10),
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
}
// }
