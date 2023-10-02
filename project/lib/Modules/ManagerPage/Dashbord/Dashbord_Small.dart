import 'package:flutter/material.dart';
import 'package:ku_t/Models/status_db.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/Dropdown/YearModel.dart';
import 'package:ku_t/Modules/Component/CustomDataTable.dart';
// import 'package:ku_t/Modules/Component/Header_web.dart';
// import 'package:ku_t/Modules/Dropdown/YearModel.dart';
import 'package:ku_t/Modules/ManagerPage/Dashbord/PopUp.dart';
import 'package:ku_t/Modules/ManagerPage/Dashbord/viewmodel.dart';
import 'package:ku_t/Modules/widget/SearchWidget.dart';
import 'package:ku_t/Services/apiconnector/callapt.dart';

class DashbordSmall extends StatefulWidget {
  const DashbordSmall({super.key});

  @override
  State<DashbordSmall> createState() => _DashbordSmallState();
}

class _DashbordSmallState extends State<DashbordSmall> {
  // CollectionReference addsubject =
  //     FirebaseFirestore.instance.collection('subject');
  // late TextEditingController controller;
  String? selectedValue; //N
  bool isImport = true;
  // ถ้า false จะเป็นไม่พบหลักสูตร ถ้า true คือมีข้อมูลหลักสูตรแล้ว (ข้อมูลจะขึ้นในตาราง)
  var isExist;
  final ViewModel _viewModel = ViewModel();

  @override
  void initState() {
    super.initState();
    isExist = get_status_db();
  }

  Future<bool> get_status_db() async {
    isExist = await _viewModel.get_status();
    return isExist;
  }

  //TextEditingController coursecodeC = TextEditingController(); //y
  //TextEditingController coursenameC = TextEditingController();

  // @override
  // void dispose() {
  //   controller.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return FutureBuilder(
        future: _viewModel.get_status(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (_viewModel.status == true) {
              return const Center(child: Text("ji"));
            } else {
              return const Center(child: Text("Nook"));
            }
          } else {
            return const LinearProgressIndicator();
          }
        });
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

  Column _DropdownSelectYear() {
    final orientation = MediaQuery.of(context).orientation;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            "ปีหลักสูตร",
            style: textStylehintbold(),
          ),
        ),
        Container(
          width: orientation == Orientation.portrait ? double.infinity : 100,
          height: 50,
          decoration: decoration(),
          child: DropdownButtonFormField(
              hint: Text(
                "เลือก",
                style: textStylehint(),
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(15),
              ),
              validator: (value) {
                if (value == null) {
                  return "";
                }
                return null;
              },
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              focusColor: Colors.white,
              dropdownColor: Colors.white,
              isExpanded: false,
              value: selectedValue,
              items: year //แก้
                  .map((e) => DropdownMenuItem<String>(
                      value: e.title,
                      child: Text(
                        e.title!,
                        style: textStylehint(),
                      )))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value.toString();
                });
              }),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  // Column _SearchSubject() {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Container(
  //         alignment: Alignment.topLeft,
  //         child: Text("ค้นหารายวิชา", style: textStylehintbold()),
  //       ),
  //       Row(
  //         children: [
  //           //ช่องใส่รหัส/วิชา
  //           Expanded(
  //             child: Container(
  //               width: MediaQuery.of(context).size.width,
  //               // width: 300,
  //               height: 50,
  //               decoration: decoration(),
  //               child: const TextField(
  //                 cursorColor: Color.fromRGBO(172, 173, 191, 1),
  //                 decoration: InputDecoration(
  //                   border: InputBorder.none,
  //                   hintStyle: TextStyle(fontSize: 14),
  //                   hintText: "รหัสวิชา / ชื่อรายวิชา",
  //                   // hintStyle: textStyle(16),
  //                   contentPadding: EdgeInsets.all(15),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             width: 10,
  //           ),
  //           Row(
  //             children: [
  //               Container(
  //                 height: 50,
  //                 width: 80,
  //                 padding: const EdgeInsets.symmetric(vertical: 10),
  //                 decoration: decorationgreen(),
  //                 child: TextButton(
  //                   onPressed: () {
  //                     print("hit!");
  //                   },
  //                   child: Text(
  //                     'ค้นหา',
  //                     style: textStylewhite(),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           )
  //         ],
  //       ),
  //     ],
  //   );
  // }

  // ignore: non_constant_identifier_names
  Container _ButtonImportCourse() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
        margin: orientation == Orientation.portrait
            ? null
            : EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        height: 50,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: decorationborder(),
        child: TextButton(
          onPressed: () {
            print("นำเข้าหลักสูตร");
            Navigator.pushNamed(context, '/import');
          },
          child: Text(
            'นำเข้าหลักสูตร',
            style: textStylegreen(),
          ),
        ));
  }

  // ignore: non_constant_identifier_names
  Container _ButtonAdd() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
        margin: orientation == Orientation.portrait
            ? null
            : EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        height: 50,
        // width: 100,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: decorationgreen(),
        child: TextButton(
          onPressed: () {
            openDialog();
          },
          child: Text(
            'เพิ่มรายวิชา',
            style: textStylewhite(),
          ),
        ));
  }

  Container _textCourseStructure() {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(top: 8),
      child: const Text(
        "โครงสร้างรายวิชา",
        // style: textStyleHeadDrop(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
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

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => const Dialog(child: PopupManagerView()));
}
