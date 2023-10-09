// ignore: file_names
import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/Component/Timetable.dart';
import 'package:ku_t/Modules/Dropdown/SemesterModel.dart';
import 'package:ku_t/Modules/Dropdown/YearSModel.dart';

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

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: NavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          _textheader(),
          // Container(
          //   alignment: Alignment.topLeft,
          //   child: Text(
          //     "กำหนดเวลาสอน",
          //     style: textStyleHeader()
          //   ),
          // ),
          const Divider(height: 26),
          Container(
              child: orientation == Orientation.portrait
                  ? Column(
                      children: [
                        _selectSemester(),
                        SizedBox(
                          height: 10,
                        ),
                        _selectYearS(),
                        SizedBox(
                          height: 10,
                        ),
                        _DownloadFileExcel(),
                        // SearchBarWidget(
                        //     isReadOnly: true,
                        //     hasBackButton: false,
                        //   ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            _selectSemester(),
                            SizedBox(
                              width: 10,
                            ),
                            _selectYearS(),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(child: _checkBox()),
                            SizedBox(
                              width: 175,
                            ),
                            Expanded(
                              // child: SearchBarWidget(
                              //   isReadOnly: true,
                              //   hasBackButton: false,
                              // ),
                              child: _DownloadFileExcel(),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   height: 450,
                        //   child: Addtime())
                      ],
                    )),
        ]),
      ),
    );
  }

  Container _selectSemester() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
        child: Column(children: [
      Container(
        alignment: Alignment.bottomLeft,
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
                // width: MediaQuery.of(context).size.width,
                height: 48,
                decoration: decorationgc(),
                child: Row(
                  children: [
                    Checkbox(
                        value: firstValue,
                        onChanged: (value) {
                          setState(() {
                            firstValue = value!;
                          });
                        }),
                    Text(
                      "T12-1",
                      style: textStylehint(),
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
                    Checkbox(
                        value: secondValue,
                        onChanged: (value) {
                          setState(() {
                            secondValue = value!;
                          });
                        }),
                    Text(
                      "T12-2",
                      style: textStylehint(),
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
                    Checkbox(
                        value: thirdValue,
                        onChanged: (value) {
                          setState(() {
                            thirdValue = value!;
                          });
                        }),
                    Text(
                      "T12-3",
                      style: textStylehint(),
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
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: MediaQuery.of(context).size.width,
                height: 48,
                decoration: decorationgc(),
                child: Row(
                  children: [
                    Checkbox(
                        value: fourthValue,
                        onChanged: (value) {
                          setState(() {
                            fourthValue = value!;
                          });
                        }),
                    Text(
                      "T12-4",
                      style: textStylehint(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Container _textheader() {
    return Container(
      alignment: Alignment.topLeft,
      child: const Text(
        "ตารางสอน",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
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
