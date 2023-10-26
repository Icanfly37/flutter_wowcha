import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/Dropdown/DaysModel.dart';
import 'package:ku_t/Modules/Dropdown/TeachernameModel.dart';
import 'package:ku_t/Modules/Dropdown/TimeEndModel.dart';
import 'package:ku_t/Modules/Dropdown/TimeStartModel.dart';
import 'package:ku_t/Modules/ManagerPage/AdTime/value_for_time.dart';
import 'package:ku_t/Services/apiconnector/callapt.dart';
import 'package:unicons/unicons.dart';

class HomeScreen extends StatefulWidget {
  final String taskId;

  const HomeScreen({Key? key, required this.taskId}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Operator _operator = Operator();
  Variable _variable = Variable();

  final List<TextEditingController> _studygroup = [];
  final List<TextEditingController> _numberopen = [];
  final List<String?> _room = [];
  final List<String?> _daysvalue = [];
  final List<String?> _timeStartvalue = [];
  final List<String?> _timeEndvalue = [];
  final _formKeyyy = GlobalKey<FormState>();

  int number = 1;

  final List<String?> _checkbox1 = [];
  final List<String?> _checkbox2 = [];
  final List<String?> _checkbox3 = [];
  final List<String?> _checkbox4 = [];
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addField();
    });
  }

  _addField() {
    setState(() {
      _studygroup.add(TextEditingController());
      _numberopen.add(TextEditingController());
      _room.add(null);
      _daysvalue.add(null);
      _timeStartvalue.add(null);
      _timeEndvalue.add(null);
      _checkbox1.add(null);
      _checkbox2.add(null);
      _checkbox3.add(null);
      _checkbox4.add(null);
    });
  }

  _removeItem(int i) {
    setState(() {
      _studygroup.removeAt(i);
      _numberopen.removeAt(i);
      _room.removeAt(i);
      _daysvalue.removeAt(i);
      _timeStartvalue.removeAt(i);
      _timeEndvalue.removeAt(i);
      _checkbox1.removeAt(i);
      _checkbox2.removeAt(i);
      _checkbox3.removeAt(i);
      _checkbox4.removeAt(i);
    });
  }

  void _submit() {
    final isValid = _formKeyyy.currentState!.validate();
    if (!isValid) {
      return;
    }
    // print(_studygroup.toList());
    // print(_room.toList());
    // print(_numberopen.toList());
    // print(_daysvalue.toList());
    // print(_timeStartvalue.toList());
    // print(_timeEndvalue.toList());
    // print(_checkbox1.toList());
    // print(_checkbox2.toList());
    // print(_checkbox3.toList());
    // print(_checkbox4.toList());

    _formKeyyy.currentState!.save();

    for (int i = 0; i < _studygroup.length; i++) {
      _operator.collecter.add(
        Require_Data(
          studygroup : _studygroup[i].text,
          numberopen : _numberopen[i].text,
          room : _room[i],
          daysvalue : _daysvalue[i],
          timeStartvalue : _timeStartvalue[i],
          timeEndvalue : _timeEndvalue[i],
          checkbox1 : _checkbox1[i],
          checkbox2 : _checkbox2[i],
          checkbox3 : _checkbox3[i],
          checkbox4 : _checkbox4[i]
        )
      );
    }
    _operator.combind_to_list({"อาจารย์ผู้สอน":_variable.teacher_name});//_variable.teacher_name แก้ด้วยถ้า data เป็น List<ใดๆ> / Map<ใดๆ,ใดๆ>
    _operator.all_data[_variable.course_code] = _operator.element; //_variable.course_code แก้ด้วยถ้า data เป็น List<ใดๆ> / Map<ใดๆ,ใดๆ>
    //print(_operator.all_data);
    updates_data("Update_Course",_operator.all_data);
    _operator.all_clear();
    //print("---------------------------------------------------------------------");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('เลือกรายวิชา',
        style: textStyleHeadDrop(),),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "จำนวนหมู่เรียน",
                    style: textStylehintbold(),
                  ),
                ),
                Container(
                  height: 55,
                  padding: EdgeInsets.only(left: 15),
                  decoration: decoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(number.toString()),
                      IconButton(
                        onPressed: () {
                          number++;
                          _addField();
                        },
                        icon: Icon(UniconsLine.angle_up)),
                        
                    ],
                  ),
                ),
              ],
            ),
          ),)
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 20,left: 20,right: 20,top: 10),
        child: Form(
          key: _formKeyyy,
          child: ListView.builder(
            itemCount: _studygroup.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
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
                              controller: _studygroup[index],
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
                      ),
                      const SizedBox(width: 10),
                      Expanded(
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
                              controller: _numberopen[index],
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
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "ห้องเรียน",
                                style: textStylehintbold(),
                              ),
                            ),
                            DropdownButtonFormField(
                              decoration: inputdecorationtext(),
                              validator: (value) {
                                if (value == null) {
                                  return "เลือก";
                                }
                                return null;
                              },
                              focusColor: Colors.white,
                              dropdownColor: Colors.white,
                              isExpanded: false,
                              value: _room[index],
                              items: rooms
                                  .map((e) => DropdownMenuItem<String>(
                                        value: e.title,
                                        child: Text(
                                          e.title!,
                                          style: textStylehint(),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _room[index] = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
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
                              value: _daysvalue[index],
                              items: days
                                  .map((e) => DropdownMenuItem<String>(
                                        value: e.title,
                                        child: Text(
                                          e.title!,
                                          style: textStylehint(),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _daysvalue[index] = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "เวลาเริ่มต้น",
                                style: textStylehintbold(),
                              ),
                            ),
                            DropdownButtonFormField(
                              decoration: inputdecorationtext(),
                              validator: (value) {
                                if (value == null) {
                                  return "เลือก";
                                }
                                return null;
                              },
                              focusColor: Colors.white,
                              dropdownColor: Colors.white,
                              isExpanded: false,
                              value: _timeStartvalue[index],
                              items: timeStart
                                  .map((e) => DropdownMenuItem<String>(
                                        value: e.title,
                                        child: Text(
                                          e.title!,
                                          style: textStylehint(),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _timeStartvalue[index] = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "เวลาสิ้นสุด",
                                style: textStylehintbold(),
                              ),
                            ),
                            DropdownButtonFormField(
                              decoration: inputdecorationtext(),
                              validator: (value) {
                                if (value == null) {
                                  return "เลือก";
                                }
                                return null;
                              },
                              focusColor: Colors.white,
                              dropdownColor: Colors.white,
                              isExpanded: false,
                              value: _timeEndvalue[index],
                              items: timeEnd
                                  .map((e) => DropdownMenuItem<String>(
                                        value: e.title,
                                        child: Text(
                                          e.title!,
                                          style: textStylehint(),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _timeEndvalue[index] = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Column(
                    children: [
                      Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "ชั้นปี",
                                style: textStylehintbold(),
                              ),
                            ),
                      Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 48,
                decoration: decorationgc(),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                            children: [
                              Expanded(
                                child: Radio(
                                  value: 'T12-1', 
                                  groupValue: _checkbox1[index], 
                                  onChanged: (value) {
                                    setState(() {
                                      _checkbox1[index] = value;
                                    });
                                  },),
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
                    Expanded(
                      child: Row(
                            children: [
                              Expanded(
                                child: Radio(
                                  value: 'T12-2', 
                                  groupValue: _checkbox2[index], 
                                  onChanged: (value) {
                                    setState(() {
                                      _checkbox2[index] = value;
                                    });
                                  },),
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
                    Expanded(
                      child: Row(
                            children: [
                              Expanded(
                                child: Radio(
                                  value: 'T12-3', 
                                  groupValue: _checkbox3[index], 
                                  onChanged: (value) {
                                    setState(() {
                                      _checkbox3[index] = value;
                                    });
                                  },),
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
                    Expanded(
                      child: Row(
                            children: [
                              Expanded(
                                child: Radio(
                                  value: 'T12-4', 
                                  groupValue: _checkbox4[index], 
                                  onChanged: (value) {
                                    setState(() {
                                      if (value != null) {
                                        _checkbox4[index] = value;
                                      }
                                      _checkbox4[index] = value;
                                    });
                                  },),
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
                  ],
                ),
              ),
                    ],
                  ),
                  const SizedBox(height: 10),
              Column(
                children: [
                  Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "",
                                    style: textStylehintbold(),
                                  ),
                                ),
                  Container(
                        width: double.infinity,
                        height: 55,
                        decoration: decorationred(),
                        child: TextButton(
                            child: Text('ลบ Sec',
                            style: textStylewhite(),),
                            onPressed: () {
                              number--;
                              _removeItem(index);},
                          ),
                      ),
                ],
              ),
              const SizedBox(height: 10,)
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 55,
                decoration: decorationredborder(),
                child: TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('ยกเลิก',
                  style: textStylered()),
                ),
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              flex: 2,
              child: Container(
                height: 55,
                decoration: decorationgreen(),
                child: TextButton(
                  onPressed: _submit,
                  child: Text('ตกลง',
                  style: textStylewhite(),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
