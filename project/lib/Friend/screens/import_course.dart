import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../Dropdown/TeachernameModel.dart';
import '../modules/component/Header_web.dart';
import '../modules/component/sidebar.dart';

class ImportPage extends StatefulWidget {
  const ImportPage({Key? key}) : super(key: key);

  @override
  State<ImportPage> createState() => _ImportPageState();
}

class _ImportPageState extends State<ImportPage> {
  CollectionReference addsubject =
      FirebaseFirestore.instance.collection('subject');
  final _key = GlobalKey<FormState>();
  String? selectedValue;
  String? creditValue;
  String? teachernameValue;
  String? basicsubjectValue;
  late TextEditingController controller;

  TextEditingController coursecodeC = TextEditingController();
  TextEditingController coursenameC = TextEditingController();

  void adddata() async {
    await addsubject.add({
      "coursecode": coursecodeC.text.trim(),
      "credit": creditValue.toString(),
      "coursename": coursenameC.text.trim(),
      "teachername": teachernameValue.toString(),
      "basicsubject": basicsubjectValue.toString()
    }).whenComplete(() => Navigator.pop(context));
  }

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  //--------------------------------------------------------พื้นที่ของ widget ทั้งหมด---------------------------------------------------------------
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      //------------------------------------------------------header web--------------------------------------------------------------------------
      appBar: NavBar(),
      //------------------------------------------------------end header web--------------------------------------------------------------------------
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Form(
          key: _key,
          child: Column(
            children: [
              SideBarXExample(
                  controller:
                      SidebarXController(selectedIndex: 1, extended: true)),

              //------------------------------------------------------body web--------------------------------------------------------------------------
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "การนำเข้าข้อมูลหลักสูตร",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              //------------------------------------------------------end body web--------------------------------------------------------------------------
              Divider(height: 30), // Draw Line
              //------------------------------------------------------สำหรับจอแนวนอน----------------------------------------------------------
              Container(
                  child: orientation == Orientation.portrait
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: const Text(
                                    "ปีการศึกษา",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(230, 230, 230, 1),
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
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    style: TextStyle(fontSize: 14),
                                    items: [
                                      "2562",
                                      "2563",
                                      "2564",
                                      "2565",
                                      "2566",
                                      "2567",
                                      "2568",
                                      "2569",
                                      "2570"
                                    ].map<DropdownMenuItem<String?>>((e) {
                                      return DropdownMenuItem(
                                        child: Text(e.toString()),
                                        value: e,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: const Text(
                                    "ค้นหารายวิชา",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.height,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                230, 230, 230, 1),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: const TextField(
                                          cursorColor:
                                              Color.fromRGBO(172, 173, 191, 1),
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
                                      width: 10,
                                    ),
                                    Container(
                                      width: 70,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Color.fromRGBO(0, 102, 94, 1)),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'ค้นหา',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(0, 102, 94, 1),
                                    width: 2),
                                borderRadius: BorderRadius.circular(15),
                                // color: Color.fromRGBO(0, 102, 94, 1)
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'จัดการรายวิชา',
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 102, 94, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(0, 102, 94, 1)),
                              child: TextButton(
                                onPressed: () {
                                  //openDialog();
                                },
                                child: const Text(
                                  'เพิ่มรายวิชา',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(47, 51, 55, 1)),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ImportPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'นำเข้าหลักสูตร',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                            )
                          ],
                        )
                      //---------------------------------------------------end สำหรับจอแนวนอน----------------------------------------------------------
                      //------------------------------------------------สำหรับหน้าจอแนวนอน-----------------------------------------------------------
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 15),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(),
                              ],
                            ),
                          ],
                        )
                  //------------------------------------------------end สำหรับหน้าจอแนวนอน-----------------------------------------------------------
                  )
            ],
          ),
        ),
      ),
    );
  }
  //----------------------------------------------------end พื้นที่ของ widget ทั้งหมด-----------------------------------------------------------------
}
