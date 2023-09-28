import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/Dropdown/DaysModel.dart';
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
          Container(
            // width: MediaQuery.of(context).size.height,
            decoration: decoration(),
            child: TextFormField(
              // controller: coursenameC,
              keyboardType: TextInputType.number,
              cursorColor: const Color.fromRGBO(172, 173, 191, 1),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: textStylehint(),
                hintText: "หมู่เรียน",
                contentPadding: EdgeInsets.all(15),
              ),
            ),
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
          Container(
            // width: MediaQuery.of(context).size.height,
            decoration: decoration(),
            child: TextFormField(
              // controller: coursenameC,
              keyboardType: TextInputType.number,
              cursorColor: const Color.fromRGBO(172, 173, 191, 1),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: textStylehint(),
                hintText: "จำนวนที่เปิดรับ",
                contentPadding: EdgeInsets.all(15),
              ),
            ),
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
          Container(
            // width: MediaQuery.of(context).size.height,
            decoration: decoration(),
            child: TextFormField(
              // controller: coursenameC,
              keyboardType: TextInputType.number,
              cursorColor: const Color.fromRGBO(172, 173, 191, 1),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: textStylehint(),
                hintText: "ห้อง",
                contentPadding: EdgeInsets.all(15),
              ),
            ),
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
        Container(
          decoration: decoration(),
          child: DropdownButtonFormField(
              hint: Text(
                "วัน",
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
        ),
      ],
    );
  }

  Column _timeStart() {
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            "เวลาเริ่มต้น",
            style: textStylehintbold(),
          ),
        ),
      Container(
       decoration: decoration(),
        child: TextFormField(
           controller: timestart, //editing controller of this TextField
           decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: textStylehint(),
            hintText: "00:00",
            contentPadding: EdgeInsets.all(15),
          ),
           readOnly: true,  //set it true, so that user will not able to edit text
           onTap: () async {
             TimeOfDay? pickedTime =  await showTimePicker(
                     initialTime: TimeOfDay.now(),
                     context: context,
                 );
             
             if(pickedTime != null ){
                 print(pickedTime.format(context));   //output 10:51 PM
                 DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                 //converting to DateTime so that we can further format on different pattern.
                 print(parsedTime); //output 1970-01-01 22:53:00.000
                 String formattedTime = DateFormat('HH:mm').format(parsedTime);
                 print(formattedTime); //output 14:59:00
                 //DateFormat() is from intl package, you can format the time on any pattern you need.
      
                 setState(() {
                   timestart.text = formattedTime; //set the value of text field. 
                 });
             }else{
                 print("Time is not selected");
             }
           },
        ),
      )
    ],);
  }

  Column _timeStop() {
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            "เวลาสิ้นสุด",
            style: textStylehintbold(),
          ),
        ),
      Container(
       decoration: decoration(),
        child: TextFormField(
           controller: timestop, //editing controller of this TextField
           decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: textStylehint(),
            hintText: "00:00",
            contentPadding: EdgeInsets.all(15),
          ),
           readOnly: true,  //set it true, so that user will not able to edit text
           onTap: () async {
             TimeOfDay? pickedTime =  await showTimePicker(
                     initialTime: TimeOfDay.now(),
                     context: context,
                 );
             
             if(pickedTime != null ){
                 print(pickedTime.format(context));   //output 10:51 PM
                 DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                 //converting to DateTime so that we can further format on different pattern.
                 print(parsedTime); //output 1970-01-01 22:53:00.000
                 String formattedTime = DateFormat('HH:mm').format(parsedTime);
                 print(formattedTime); //output 14:59:00
                 //DateFormat() is from intl package, you can format the time on any pattern you need.
      
                 setState(() {
                   timestop.text = formattedTime; //set the value of text field. 
                 });
             }else{
                 print("Time is not selected");
             }
           },
        ),
      )
    ],);
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
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
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
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
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
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
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
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
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
