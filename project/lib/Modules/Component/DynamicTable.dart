// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dynamic_table/dynamic_table.dart';
import 'package:ku_t/Modules/Data/data_test.dart';
// import 'package:ku_t/Modules/Data/dummy_data.dart';

class DynamicDataTable extends StatefulWidget {
  const DynamicDataTable({
    Key? key,
  }) : super(key: key);

  @override
  State<DynamicDataTable> createState() => _DynamicDataTableState();
}

class _DynamicDataTableState extends State<DynamicDataTable> {
  var tableKey = GlobalKey<DynamicTableState>();
  // var myData = dummyData.toList();
  List<List<dynamic>> myData =
      data.map((item) => item.values.toList()).toList();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // future: fetchData(),
        future: null,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // แสดงแถบโหลดข้อมูล
          } else if (snapshot.hasError) {
            return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
          } else {
            return Builder(builder: (context) {
              return SizedBox(
                // width: MediaQuery.of(context).size.width * 0.8,
                width: MediaQuery.of(context).size.width,
                child: DynamicTable(
                  key: tableKey,
                  header: const Text(
                    "โครงสร้างรายวิชา",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onRowEdit: (index, row) {
                    print('edit row');
                    return true;
                  },
                  onRowSave: (index, old, newValue) {
                    /// validate ข้อมูลหลังจากการแก้ไข ///

                    /// newValue[0] คือคอลัมน์รหัสวิชา

                    // ถ้าข้อมูลเป็น null
                    if (newValue[0] == null || newValue[0].isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("กรุณากรอกรหัสวิชา เช่น '01234567-60'"),
                        ),
                      );
                      return null;
                    }

                    // ถ้าข้อมูลไม่เป็น null และไม่เป็นตัวเลข
                    if (newValue[0].isNotEmpty &&
                        !RegExp(r'[0-9]').hasMatch(newValue[0])) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "กรุณากรอกรหัสวิชาเป็นตัวเลข เช่น '01234567-60'"),
                        ),
                      );
                      return null;
                    }

                    // ถ้าข้อมูลเป็นตัวเลขและไม่ครบ
                    if (newValue[0].toString().length < 11) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "กรุณากรอกรหัสวิชาให้ครบ ตามด้วยปีหลักสูตร เช่น '01234567-60'"),
                        ),
                      );
                      return null;
                    }

                    // ถ้ากรอกรหัสวิชาเกิน
                    if (newValue[0].toString().length > 11) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "กรุณากรอกรหัสวิชาใหม่อีกครั้ง เช่น '01234567-60'"),
                        ),
                      );
                      return null;
                    }

                    /// newValue[1] คือคอลัมน์ชื่อรายวิชา

                    // ถ้าข้อมูลไม่เป็น null
                    if (newValue[1] == null || newValue[1].isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("กรุณากรอกชื่อรายวิชา"),
                        ),
                      );
                      return null;
                    }

                    // ถ้าข้อมูลไม่เป็น null และเป็นตัวเลข
                    if (newValue[1].isNotEmpty &&
                        RegExp(r'[0-9]').hasMatch(newValue[1])) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("กรุณากรอกชื่อรายวิชาเป็นตัวอักษรเท่านั้น"),
                        ),
                      );
                      return null;
                    }

                    // ถ้าข้อมูลไม่เป็น null และเป็นตัวอักษรพิเศษ
                    if (newValue[1].isNotEmpty &&
                        RegExp(r'[!@#$%^&*(),.?":{}[]|<>]')
                            .hasMatch(newValue[1])) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("กรุณากรอกชื่อรายวิชาเป็นตัวอักษรเท่านั้น"),
                        ),
                      );
                      return null;
                    }

                    /// newValue[3] คือคอลัมน์วิชาพื้นฐาน

                    // ถ้าข้อมูลไม่เป็นตัวเลข
                    if (newValue[3].isNotEmpty &&
                        !RegExp(r'[0-9]').hasMatch(newValue[3])) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "กรุณากรอกวิชาพื้นฐานด้วยรหัสวิชาเป็นตัวเลข เช่น '01234567'"),
                        ),
                      );
                      return null;
                    }

                    print('Update Data! index:$index');
                    print('old:$old');
                    print('new:$newValue');
                    return newValue;
                  },
                  showActions: true,
                  showAddRowButton: false,
                  rowsPerPage: 5,
                  showFirstLastButtons: true,
                  // availableRowsPerPage: const [
                  //   5,
                  //   10,
                  //   15,
                  //   20,
                  // ],
                  headingRowHeight: 60,
                  dataRowMinHeight: 60,
                  dataRowMaxHeight: 60,
                  columnSpacing: 60,
                  actionColumnTitle: "",
                  showCheckboxColumn: true,
                  actions: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('ลบรายวิชา'),
                              content: Text('คุณต้องการลบรายวิชาใช่หรือไม่?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('ยกเลิก'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    tableKey.currentState?.deleteSelectedRows();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('ยืนยัน'),
                                ),
                              ],
                            );
                          },
                        );
                        // tableKey.currentState?.deleteAllRows();
                        print('Delete row!');
                      },
                      icon: const Icon(Icons.delete),
                      // tooltip: "Delete!",
                    ),
                  ],

                  // rows
                  rows: List.generate(
                    myData.length,
                    (index) => DynamicTableDataRow(
                      index: index,
                      cells: List.generate(
                        myData[index].length,
                        (cellIndex) => DynamicTableDataCell(
                          value: myData[index][cellIndex],
                        ),
                      ),
                    ),
                  ),

                  // ชื่อ Columns
                  columns: [
                    DynamicTableDataColumn(
                        label: const Text(
                          "รหัสวิชา",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        onSort: (columnIndex, ascending) {},
                        dynamicTableInputType: DynamicTableInputType.text(
                          decoration: const InputDecoration(
                            hintText: "รหัสวิชา",
                            border: OutlineInputBorder(),
                          ),
                        )),
                    DynamicTableDataColumn(
                        label: const Text(
                          "ชื่อรายวิชา",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        onSort: (columnIndex, ascending) {},
                        // isEditable: false,
                        dynamicTableInputType: DynamicTableInputType.text(
                          decoration: const InputDecoration(
                            hintText: "ชื่อรายวิชา",
                            border: OutlineInputBorder(),
                          ),
                        )),
                    DynamicTableDataColumn(
                      label: const Text(
                        "หน่วยกิต",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      dynamicTableInputType:
                          DynamicTableInputType.dropDown<String>(
                        items: creditDropdown
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(growable: false),
                        selectedItemBuilder: (context) {
                          return creditDropdown
                              .map((e) => Text(e))
                              .toList(growable: false);
                        },
                        decoration: const InputDecoration(
                            hintText: "Select credit",
                            border: OutlineInputBorder()),
                        displayBuilder: (value) =>
                            value ??
                            "", // How the string will be displayed in non editing mode
                      ),
                    ),
                    DynamicTableDataColumn(
                      label: const Text(
                        "วิชาพื้นฐาน",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      onSort: (columnIndex, ascending) {},
                      // isEditable: false,
                      dynamicTableInputType: DynamicTableInputType.text(
                        decoration: const InputDecoration(
                          hintText: "วิชาพื้นฐาน",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
          }
        });
  }
}
