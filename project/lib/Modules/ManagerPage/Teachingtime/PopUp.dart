import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:ku_t/Modules/Componemt/Header_web.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/Dropdown/DaysModel.dart';
import 'package:ku_t/Modules/Dropdown/TimeEndModel.dart';
import 'package:ku_t/Modules/Dropdown/TimeStartModel.dart';
import 'package:unicons/unicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TextEditingController> _controllerinput = [TextEditingController()];
  // List<TextField> _studygroup = [TextField()];
  // List<TextField> _numberopen = [TextField()];
  // // List<TextField> _room = [TextField()];
  // List<TextField> _days = [TextField()];

  int number = 1;

  TextEditingController timestart = TextEditingController();
  TextEditingController timestop = TextEditingController();
  //text editing controller for text field
  final _formKeyy = GlobalKey<FormState>();
  
  @override
  void initState() {
    timestart.text = "";
    timestop.text = "";
    super.initState();
  }

  bool firstValue = false;
  bool secondValue = false;
  bool thirdValue = false;
  bool fourthValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 500,
      decoration: decorationradius(),
      child: Form(
        key: _formKeyy,
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text('เลือกรายวิชา',
                style: textStyleHeadDrop(),),
                SizedBox(height: 20,),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('จำนวนหมู่เรียน',
                  style: textStylehintbold(),),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: decoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // width: double.infinity,
                        alignment: Alignment.topLeft,
                        decoration: decoration(),
                        child: TextButton(
                          onPressed: () {
                            number++;
                          _addInputField(context);
                        }, 
                        child: Text(number.toString(),
                        style: textStylehint(),)),
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon:  Icon(UniconsLine.angle_up), 
                          onPressed: () {
                            number++;
                          _addInputField(context);
                          },),
                          // IconButton(icon:  Icon(UniconsLine.angle_down), 
                          // onPressed: () {
                          //   number--;
                          // setState(() {
                          // });
                          // },)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(    
                  shrinkWrap: true,     
                  itemCount: _controllerinput.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                            Row(
                              children: [
                                _studygroup(),
                                SizedBox(width: 10,),      
                                _numberopen(),
                                SizedBox(width: 10,),    
                                _room()                            
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Expanded(flex: 2,
                                  child: _days()),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: _timeStart()),
                                  SizedBox(width: 10,),
                                Expanded(child: _timeStop())
                              ],
                            ),
                            SizedBox(height: 10,),
                            _checkBox(),
                            SizedBox(height: 10,),
                            Container(
                              width: double.infinity,
                              // height: 55,
                              padding: EdgeInsets.symmetric(vertical: 5),
                              decoration: decorationredborder(),
                              child: TextButton(onPressed: () {
                                print(index);
                                setState(() {
                                  number--;
                                   _controllerinput.removeAt(index);
                                  // _numberopen.removeAt(index);
                                  // _studygroup.removeAt(index);
                                });
                               
                              }, child: Text('ลบ Sec',
                              style: textStylered()),),
                            ),
                            SizedBox(height: 10,),
                      ],
                    );
                  })),
                  _button()
              ],
            ),
          ),
      ),
    );
  }

  Expanded _studygroup() {
    return Expanded(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "หมู่เรียน",
              style: textStylehintbold(),
            ),
          ),
          TextFormField(
            validator: (value) {
              if(value!.isEmpty) {
                return "กรุณากรอก";
              }
              if(value.characters.length != 3) {
                return "กรุณากรอกรหัสวิชาให้ถูกด้อง";
              }
              return null;
            },
            // controller: coursenameC,
            keyboardType: TextInputType.number,
            cursorColor: const Color.fromRGBO(172, 173, 191, 1),
            decoration: inputdecorationtext(),
          ),
        ],
      ),
    );
  }

  Expanded _numberopen() {
    return Expanded(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "จำนวนที่เปิดรับ",
              style: textStylehintbold(),
            ),
          ),
          TextFormField(
            // controller: coursenameC,
            validator: (value) {
              if(value!.isEmpty) {
                return "กรุณากรอก";
              }
              return null;
            },
            keyboardType: TextInputType.number,
            cursorColor: const Color.fromRGBO(172, 173, 191, 1),
            decoration: inputdecorationtext(),
          ),
        ],
      ),
    );
  }

  Expanded _room() {
    return Expanded(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "ห้อง",
              style: textStylehintbold(),
            ),
          ),
          TextFormField(
            // controller: coursenameC,
            validator: (value) {
              if(value!.isEmpty) {
                return "กรุณากรอก";
              }
              return null;
            },
            keyboardType: TextInputType.number,
            cursorColor: const Color.fromRGBO(172, 173, 191, 1),
            decoration: inputdecorationtext()
          ),
        ],
      ),
    );
  }

  Column _days() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            "วัน",
            style: textStylehintbold(),
          ),
        ),
        DropdownButtonFormField(
            // hint: Text(
            //   "วัน",
            //   style: textStylehint(),
            // ),
            decoration: inputdecorationtext(),
            validator: (value) {
              if (value == null) {
                return "กรุณากรอก";
              }
              return null;
            },
            focusColor: Colors.white,
            dropdownColor: Colors.white,
            isExpanded: false,
            // value: teachernameValue,
            items: days
                .map((e) => DropdownMenuItem<String>(
                    value: e.title, child: Text(e.title!,
                    style: textStylehint(),)))
                .toList(),
            onChanged: (value) {
              setState(() {
                // teachernameValue = value.toString();
              });
            }),
      ],
    );
  }

  Column _timeStart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            "วัน",
            style: textStylehintbold(),
          ),
        ),
        DropdownButtonFormField(
            hint: Text(
              "00:00",
              style: textStylehint(),
            ),
            decoration: inputdecorationtext(),
            validator: (value) {
              if (value == null) {
                return "กรุณากรอก";
              }
              return null;
            },
            focusColor: Colors.white,
            dropdownColor: Colors.white,
            isExpanded: false,
            // value: teachernameValue,
            items: timeStart
                .map((e) => DropdownMenuItem<String>(
                    value: e.title, child: Text(e.title!,
                    style: textStylehint(),)))
                .toList(),
            onChanged: (value) {
              setState(() {
                // teachernameValue = value.toString();
              });
            }),
      ],
    );
  }

  Column _timeStop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            "วัน",
            style: textStylehintbold(),
          ),
        ),
        DropdownButtonFormField(
            hint: Text(
              "00:00",
              style: textStylehint(),
            ),
            decoration: inputdecorationtext(),
            validator: (value) {
              if (value == null) {
                return "กรุณากรอก";
              }
              return null;
            },
            focusColor: Colors.white,
            dropdownColor: Colors.white,
            isExpanded: false,
            // value: teachernameValue,
            items: timeEnd
                .map((e) => DropdownMenuItem<String>(
                    value: e.title, child: Text(e.title!,
                    style: textStylehint(),)))
                .toList(),
            onChanged: (value) {
              setState(() {
                // teachernameValue = value.toString();
              });
            }),
      ],
    );
  }

  Row _button() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: decorationgreen(),
            child: TextButton(
              onPressed: () {
                if(_formKeyy.currentState!.validate()) {
                  print("Validated");
                } else {
                  print("Not Validated");
                }
              },
              child: Text(
                "ตกลง",
                style: textStylewhite(),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: decorationredborder(),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "ยกเลิก",
                style: textStylered(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _checkBox() {
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            "ชั้นปี",
            style: textStylehintbold(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: decorationgc(),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
            Container(
              decoration: decorationgc(),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
            Container(
              decoration: decorationgc(),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
            Container(
              decoration: decorationgc(),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
            )
          ],
        ),
      ],
    );
  }

  _addInputField(context) {
    final inputContrller = TextEditingController();
    // final inputContrllerr = TextEditingController();

    // final inputStudygroup = _generateInputStudygroup(inputContrller);
    // final inputNumberopen = _generateInputNumberopen(inputContrllerr);
    // // final inputRoom = _generateInputRoom(inputContrllerr);
    // final inputDays = _generateInputDays(inputContrllerr);

    setState(() {
      _controllerinput.add(inputContrller);
      // _studygroup.add(inputStudygroup);
      // _numberopen.add(inputNumberopen);
      // // _room.add(inputRoom);
      // _days.add(inputDays);
    });
  }

  // _generateInputStudygroup(inputController) {
  //   return TextField(
  //     controller: inputController,
  //   );
  // }

  // _generateInputNumberopen(inputController) {
  //   return TextField(
  //     controller: inputController,
  //   );
  // }

  // // _generateInputRoom(inputController) {
  // //   return TextField(
  // //     controller: inputController,
  // //   );
  // // }

  // _generateInputDays(inputController) {
  //   return TextField(
  //     controller: inputController,
  //   );
  // }
}
