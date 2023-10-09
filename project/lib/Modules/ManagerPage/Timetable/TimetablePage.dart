// ignore: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/Dropdown/SemesterModel.dart';
import 'package:ku_t/Modules/Dropdown/YearSModel.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {

  String? semesterValue;
  String? yearsValue;

  bool firstValue = false;
  bool secondValue = false;
  bool thirdValue = false;
  bool fourthValue = false;


  Widget cancellIcon() => const Padding(
    padding: EdgeInsets.only(bottom: 20,top: 20),
    child: SizedBox());

  Widget coloredBox(Widget child, {bool top = false, bool bottom = false}) =>
      Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: top ? Colors.blue.shade900 : Colors.transparent,
                    width: 2),
                bottom: BorderSide(
                    color: top ? Colors.blue.shade900 : Colors.transparent,
                    width: 2),
                left: BorderSide(
                    color: top ? Colors.blue.shade900 : Colors.transparent,
                    width: 2),
                right: BorderSide(
                    color: top ? Colors.blue.shade900 : Colors.transparent,
                    width: 2))),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: NavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
            alignment: Alignment.topLeft,
            child: Text("ตารางสอน", style: textStyleHeader()),
          ),
          Divider(height: 30),
          Container(
            child: orientation == Orientation.portrait
            ? Column()
            : Column(
              children: [
                Row(
                  children: [
                    _selectSemester(),
                    const SizedBox(width: 10),
                    _selectYearS(),
                    const SizedBox(width: 10),
                    Expanded(child: _checkBox()),
                    const SizedBox(width: 550),
                  ],
                ),
                _table()
              ],)
          )
          ],
        ))
    );
  }

  Container _selectSemester() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      Container(
        child: Text(
          "ภาคการศึกษา",
          style: textStyleHeadDrop(),
        ),
      ),
      Container(
        width: orientation == Orientation.portrait ? double.infinity : 100,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: decoration(),
        child: DropdownButton(
            hint: Text("เลือก", style: textStylehint()),
            underline: SizedBox(),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            focusColor: Colors.white,
            dropdownColor: Colors.white,
            isExpanded: true,
            value: semesterValue,
            items: semester
                .map((e) => DropdownMenuItem<String?>(
                    value: e.title,
                    child: Text(
                      e.title!,
                      style: textStylehint(),
                    )))
                .toList(),
            onChanged: (value) {
              setState(() {
                semesterValue = value.toString();
              });
            }),
      ),
    ]));
  }

  Container _selectYearS() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "ปีการศึกษา",
            style: textStyleHeadDrop(),
          ),
        ),
        Container(
          width: orientation == Orientation.portrait ? double.infinity : 100,
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: decoration(),
          child: DropdownButton(
              hint: Text("เลือก", style: textStylehint()),
              underline: SizedBox(),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              focusColor: Colors.white,
              dropdownColor: Colors.white,
              isExpanded: true,
              value: yearsValue,
              items: years
                  .map((e) => DropdownMenuItem<String?>(
                      value: e.title,
                      child: Text(e.title!, style: textStylehint())))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  yearsValue = value.toString();
                });
              }),
        ),
      ],
    ));
  }

  Column _checkBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            "ชั้นปี",
            style: textStylehintbold(),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                decoration: decorationgc(),
                child: Row(
                  children: [
                    Expanded(
                      child: Checkbox(
                          value: firstValue,
                          onChanged: (value) {
                            setState(() {
                              firstValue = value!;
                            });
                          }),
                    ),
                    Expanded(
                      child: Text(
                        "T12-1",
                        style: textStylehint(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                decoration: decorationgc(),
                child: Row(
                  children: [
                    Expanded(
                      child: Checkbox(
                          value: secondValue,
                          onChanged: (value) {
                            setState(() {
                              secondValue = value!;
                            });
                          }),
                    ),
                    Expanded(
                      child: Text(
                        "T12-2",
                        style: textStylehint(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                decoration: decorationgc(),
                child: Row(
                  children: [
                    Expanded(
                      child: Checkbox(
                          value: thirdValue,
                          onChanged: (value) {
                            setState(() {
                              thirdValue = value!;
                            });
                          }),
                    ),
                    Expanded(
                      child: Text(
                        "T12-3",
                        style: textStylehint(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: 48,
                decoration: decorationgc(),
                child: Row(
                  children: [
                    Expanded(
                      child: Checkbox(
                          value: fourthValue,
                          onChanged: (value) {
                            setState(() {
                              fourthValue = value!;
                            });
                          }),
                    ),
                    Expanded(
                      child: Text(
                        "T12-4",
                        style: textStylehint(),
                      ),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ],
    );
  }

  Container _table() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder(
              // verticalInside: BorderSide(
              //   color: Colors.grey.shade200
              // ),
              top: BorderSide(
                color: Color.fromRGBO(0, 102, 94, 1)
              ),
              left: BorderSide(
                color: Color.fromRGBO(0, 102, 94, 1)
              ),
              right: BorderSide(
                color: Color.fromRGBO(0, 102, 94, 1)
              ),
              bottom: BorderSide(
                color: Color.fromRGBO(0, 102, 94, 1)
              ),
              horizontalInside: BorderSide(
                color: Colors.grey.shade200
              ),
            ),
            columnWidths: const {
              0: FractionColumnWidth(0),
              1: FractionColumnWidth(0),
              2: FractionColumnWidth(0),
              3: FractionColumnWidth(0),
              4: FractionColumnWidth(0),
              5: FractionColumnWidth(0),
              6: FractionColumnWidth(0),
              7: FractionColumnWidth(0),
              8: FractionColumnWidth(0),
              9: FractionColumnWidth(0),
              10: FractionColumnWidth(0),
              11: FractionColumnWidth(0),
              12: FractionColumnWidth(0),
              13: FractionColumnWidth(0),
              14: FractionColumnWidth(0),
            },
            children: [
              const TableRow(
                children: [
                  SizedBox(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Text('8:00'),
                      SizedBox(
                        height: 16,
                      ),
                    ],),
                    Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Text('9:00'),
                      SizedBox(
                        height: 16,
                      ),
                    ],),
                    Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Text('10:00'),
                      SizedBox(
                        height: 16,
                      ),
                    ],),
                    Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Text('10:00'),
                      SizedBox(
                        height: 16,
                      ),
                    ],),
                    Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Text('11:00'),
                      SizedBox(
                        height: 16,
                      ),
                    ],),
                    Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Text('12:00'),
                      SizedBox(
                        height: 16,
                      ),
                    ],),
                    Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Text('13:00'),
                      SizedBox(
                        height: 16,
                      ),
                    ],),
                    Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Text('14:00'),
                      SizedBox(
                        height: 16,
                      ),
                    ],),
                    Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Text('15:00'),
                      SizedBox(
                        height: 16,
                      ),
                    ],),
                    Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Text('16:00'),
                      SizedBox(
                        height: 16,
                      ),
                    ],),
                    Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Text('17:00'),
                      SizedBox(
                        height: 16,
                      ),
                    ],),
                    Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Text('18:00'),
                      SizedBox(
                        height: 16,
                      ),
                    ],),
                    Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Text('19:00'),
                      SizedBox(
                        height: 16,
                      ),
                    ],),
                    Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Text('20:00'),
                      SizedBox(
                        height: 16,
                      ),
                    ],),
                    
                ]
              ),
              TableRow(
                children: [
                  Container(
                    height: 60,
                    // color: Colors.white,
                    alignment: Alignment.center,
                    // decoration: decorationgreen(),
                    child: const Text('จันทร์',
                    textAlign: TextAlign.center,),
                  ),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                ]
              ),
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    child: const Text('อังคาร',
                    textAlign: TextAlign.center,),
                  ),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                ]
              ),
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    child: const Text('พุธ',
                    textAlign: TextAlign.center,),
                  ),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                ]
              ),
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    child: const Text('พฤหัสบดี',
                    textAlign: TextAlign.center,),
                  ),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                ]
              ),
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    child: Text('ศุกร์',
                    textAlign: TextAlign.center,),
                  ),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                ]
              ),
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    child: Text('เสาร์',
                    textAlign: TextAlign.center,),
                  ),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                ]
              ),
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    child: Text('อาทิตย์',
                    textAlign: TextAlign.center,),
                  ),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                  cancellIcon(),
                ]
              ),
            ],
          ),
        ),
      );
  }

  Container _DownloadFileExcel() {
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
          onPressed: () {},
          child: Text(
            'ดาวน์โหลดไฟล์ excel',
            style: textStylewhite(),
          ),
        ));
  }
}
