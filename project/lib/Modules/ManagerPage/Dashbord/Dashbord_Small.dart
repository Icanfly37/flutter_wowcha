//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ku_t/Friend/Dropdown/YearModel.dart';
import 'package:ku_t/Friend/modules/component/Header_web.dart';
import 'package:ku_t/Friend/widget/search_bar_widget.dart';
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
  String? yearValue;

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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _header(),
          const Divider(height: 30),
          Container(
              child: orientation == Orientation.portrait //short if/else
                  ? Column(
                      //is if
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _year(),
                            _selectYear(),
                            const SizedBox(height: 10),
                            _SearchSubject(),
                            const SizedBox(height: 10),
                            _ButtonSubject(),
                            const SizedBox(height: 10),
                            _ButtonAdd(),
                            const SizedBox(height: 10),
                            _importSubject()
                          ],
                        )
                      ],
                    )     
                    : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _year(),
                            const SizedBox(height: 2),
                            _selectYear(),
                          ],
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _SearchSubject(),
                              Row(
                                children: [
                                  const Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      height: 70,
                                    )
                                  ),
                                  Expanded(child: _ButtonSubject()),
                                  const SizedBox(width: 10),
                                  Expanded(child: _ButtonAdd()),
                                  const SizedBox(width: 10),
                                  Expanded(child: _importSubject())
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
            ),
        ]
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
          fontSize: 28,
        ),
      ),
    );
  }

  Container _year() {
    return Container(
      alignment: Alignment.topLeft,
      child: const Text(
        "ปีการศึกษา",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container _selectYear() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      width: 100,
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
            value: e,
            child: Text(e.toString()),
          );
        }).toList(),
      ),
    ),
          Container(
            width: orientation == Orientation.portrait ? double.infinity : 100,
            padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: decoration(),
                      child: DropdownButton(
                    
            hint: Text("เลือก",
            style: textStylehint()),
            underline: SizedBox(),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            focusColor: Colors.white,
            dropdownColor: Colors.white,
            isExpanded: true,
            value: yearValue,
            items: year
                .map((e) => DropdownMenuItem<String?>(
                    value: e.title, child: Text(e.title!,
                    style: textStylehint(),)))
                .toList(),
            onChanged: (value) {
              setState(() {
                yearValue = value.toString();
              });
            }),
                    ),
        ],
      )
    );
  }
<<<<<<< Updated upstream

    // ignore: non_constant_identifier_names
  Column _SearchSubject() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
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
            //ช่องใส่รหัส/วิชา
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.height,
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
              width: 10,
            ),
            Row(
              children: [
                Container(
                  width: 70,
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
=======
  // ignore: non_constant_identifier_names
>>>>>>> Stashed changes
  Container _ButtonSubject() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
<<<<<<< Updated upstream
      width: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        border:
            Border.all(color: const Color.fromRGBO(0, 102, 94, 1), width: 2),
        borderRadius: BorderRadius.circular(15),
        // color: Color.fromRGBO(0, 102, 94, 1)
      ),
      child: TextButton(
        onPressed: () {
          print("จัดการรายวิชา");
        },
        child: const Text(
          'จัดการรายวิชา',
          style: TextStyle(
              color: Color.fromRGBO(0, 102, 94, 1),
              fontWeight: FontWeight.bold,
              fontSize: 14),
=======
      child: Container(
        margin: orientation == Orientation.portrait ? null : EdgeInsets.only(top: 23),
        width: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: decorationborder(),
        child: TextButton(
          onPressed: () {},
          child: Text(
            'จัดการรายวิชา',
            style: textStylegreen()
          ),
>>>>>>> Stashed changes
        ),
      )
    );
  }

    // ignore: non_constant_identifier_names
  Container _ButtonAdd() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      child: Container(
        margin: orientation == Orientation.portrait ? null : EdgeInsets.only(top: 23),
        width: MediaQuery.of(context).size.height,
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
        ),
      )
    );
  }

  Container _ButtonCourses() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      child: Container(
        margin: orientation == Orientation.portrait ? null : EdgeInsets.only(top: 23),
        width: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal:10),
          decoration: decorationblack(),
            child: TextButton(
          onPressed: () {
          },
          child: Text('นำเข้าหลักสูตร',
          style: textStylewhite()),
            ),
            )
    );
  }

  Container _importSubject() {
    return Container(
      width: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 0, 0, 0)),
      child: TextButton(
        onPressed: () {
          //print("นำเข้าหลักสูตร");
          Navigator.pushNamed(context, '/import');
        },
        child: const Text(
          'นำเข้าหลักสูตร',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
      context: context,
    builder: (context) => const Dialog(child: PopupManagerView())
  );
}
