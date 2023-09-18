import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Componemt/Header_web.dart';
import 'package:ku_t/Modules/Dropdown/YearModel.dart';
import 'package:ku_t/Modules/ManagerPage/Dashbord/PopUp.dart';
import 'package:ku_t/Modules/widget/search_bar_widget.dart';

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
                            _selectYear(),
                            const SizedBox(height: 10),
                            SearchBarWidget(hasBackButton: true, isReadOnly: true,),
                            const SizedBox(height: 10),
                            _ButtonSubject(),
                            const SizedBox(height: 10),
                            _ButtonAdd(),
                            const SizedBox(height: 10),
                            _ButtonCourses()
                          ],
                        )
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _selectYear(),
                        const SizedBox(width: 15),
                        Expanded(
                          flex: 3,
                          child: SearchBarWidget(hasBackButton: true, isReadOnly: true,)),
                          const SizedBox(width: 25),
                        Expanded(child: _ButtonSubject()),
                                const SizedBox(width: 10),
                                Expanded(child: _ButtonAdd()),
                                const SizedBox(width: 10),
                                Expanded(child: _ButtonCourses())
                      ],
                    )),
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
          fontSize: 28,
        ),
      ),
    );
  }


  Container _selectYear() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              Container(
          alignment: Alignment.topLeft,
          child: const Text(
            "ปีการศึกษา",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
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
      ),
    );
  }

    // ignore: non_constant_identifier_names
  Container _ButtonSubject() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      margin: orientation == Orientation.portrait ? null : EdgeInsets.only(top: 23),
      width: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: decorationborder(),
      child: TextButton(
        onPressed: () {
          print("จัดการรายวิชา");
        },
        child: Text(
          'จัดการรายวิชา',
          style: textStylegreen()
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
            Navigator.pushNamed(context, '/import');
          },
          child: Text('นำเข้าหลักสูตร',
          style: textStylewhite()),
            ),
            )
    );
  }

  Future openDialog() => showDialog(
      context: context,
    builder: (context) => const Dialog(child: PopupManagerView())
  );
}
