import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/Dropdown/SemesterModel.dart';
import 'package:ku_t/Modules/Dropdown/YearSModel.dart';

import 'package:ku_t/Modules/ManagerPage/Teachingtime/timesubject.dart';
import 'package:ku_t/Modules/widget/search_bar_widget.dart';

class Tabletime extends StatefulWidget {
  const Tabletime({Key? key}) : super(key: key);
  @override
  State<Tabletime> createState() => _TabletimeState();
}

class _TabletimeState extends State<Tabletime> {
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
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "กำหนดเวลาสอน",
                style: textStyleHeader()
              ),
            ),
            Divider(height: 30),
            Container(
              child: orientation == Orientation.portrait
              ? Column(
                children: [
                  _selectSemester(),
                  SizedBox(height: 10,),
                  _selectYearS(),
                  SizedBox(height: 10,),
                  SearchBarWidget(
                      isReadOnly: true,
                      hasBackButton: false, 
                    ),
                ],
              )
              : Column(
                children: [
                  Row(
                    children: [
                      _selectSemester(),
                      SizedBox(width: 10,),
                      _selectYearS(),
                      SizedBox(width: 10,),
                      Expanded(child: _checkBox()),
                      
                      SizedBox(width: 10,),
                      Expanded(
                        // flex: 2,
                        child: SearchBarWidget(
                          isReadOnly: true,
                          hasBackButton: false, 
                        ),
                        )       ,
                            
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 450,
                    child: Addtime())
                ],
              )
            ),
          ]),),
    );
  }
  
  Container _selectSemester() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      child : 
      Column(
        children: [
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
                    
            hint: Text("เลือก",
            style: textStylehint()),
            underline: SizedBox(),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            focusColor: Colors.white,
            dropdownColor: Colors.white,
            isExpanded: true,
            value: semesterValue,
            items: semester
                .map((e) => DropdownMenuItem<String?>(
                  
                    value: e.title, child: Text(e.title!,
                    style: textStylehint(),
                    )))
                .toList(),
            onChanged: (value) {
              setState(() {
                semesterValue = value.toString();
              });
            }),
                    ),
      ])
    );
  }

  Container _selectYearS() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      child : Column(
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
          padding: EdgeInsets.only(left: 10,right: 10),
                    decoration: decoration(),
                    child: DropdownButton(
          hint: Text("เลือก",
          style: textStylehint()),
          underline: SizedBox(),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          focusColor: Colors.white,
          dropdownColor: Colors.white,
          isExpanded: true,
          value: yearsValue,
          items: years
              .map((e) => DropdownMenuItem<String?>(
                  value: e.title, child: Text(e.title!,
                  style: textStylehint())))
              .toList(),
          onChanged: (value) {
            setState(() {
              yearsValue = value.toString();
            });
          }),
                  ),
        ],)

    );
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
                SizedBox(width: 10,),
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
                SizedBox(width: 10,),
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
                SizedBox(width: 10,),
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
                )
              ],
            ),
      ],
    );
  }

}