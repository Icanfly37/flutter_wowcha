import 'package:flutter/material.dart';
// import 'package:ku_t/Modules/Componemt/Header_web.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/Dropdown/CraditModel.dart';
import 'package:ku_t/Modules/ManagerPage/Dashbord/viewmodel.dart';
import 'package:ku_t/Services/apiconnector/callapt.dart';

class PopupManagerView extends StatefulWidget {
  const PopupManagerView({super.key});

  @override
  State<PopupManagerView> createState() => _PopupManagerViewState();
}

class _PopupManagerViewState extends State<PopupManagerView> {
  TextEditingController coursecodeC = TextEditingController(); //y
  TextEditingController coursenameC = TextEditingController();
  String? teachernameValue;
  String? creditValue;
  String? basicsubjectValue;
  List<String> _selectedItemsTeacher = [];
  List<String> _selectedItemsBasicsubject = [];
  // DashbordModel model = DashbordModel(
  //     basicsubjectValue: null,
  //     coursecodeCText: null,
  //     coursenameCText: null,
  //     creditValue: null,
  //     teachernameValue: null);
  @override
  void dispose() {
    coursecodeC.dispose();
    coursenameC.dispose();

    super.dispose();
  }

  void _showMultiSelectTeacher() async {
    final List<String> items = [
      "ผศ.วัชรพัฐ เมตตานันท",
      "ดร.ณัฐพล พันนุรัตน์",
      "จิรวัฒน์ จิตประสูตวิทย์",
      "รศ.ดร.อนันต์ บรรหารสกุล",
      "ผศ.ดร.ประวิทย์ ชุมชู",
      "ผศ.เพ็ญพรรณ ใช้ฮวดเจริญ",
      "กาญจนา เอี่ยมสอาด",
      "ณัฏฐ์ อรุณ",
      "ธรรมนุวัฒน์ วาลีประโคน",
      "ดร.อดิศักดิ์ สุภีสุน",
      "ผศ.ดร.กุลวดี สมบูรณ์วิวัฒน์",
      "ดร.กรวิทย์ ออกผล",
      "ผศ.ดร.นันทา จันทร์พิทักษ์",
      "ดร.ฐนียา สัตยพานิช",
      "ไพรัช สร้อยทอง",
      "ผศ.ดร.มนตรี โพธิโสโนทัย",
      "ปุณณะ ยศปัญญา",
      "ประสิทธิชัย ณรงค์เลิศฤทธิ์",
      "คทาวัชร เสถียรปกิรณกรณ์",
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    if (results != null) {
      setState(() {
        _selectedItemsTeacher = results;
      });
    }
  }

  void _showMultiSelectBasicsubject() async {
    final List<String> itemss = [
      "Engineering Mathematics I",
      "Engineering Mathematics II",
      "Engineering Mathematics III",
      "General Physics I",
      "General Physics II",
      "Laboratory in Physics I",
      "Laboratory in Physics II",
      "Electric Circuit Analysis for Computer Engineers",
      "Electric Circuit Laboratory for Computer Engineers",
      "Programming Fundamentals I",
      "Programming Fundamentals II",
      "Introduction to Computer Engineering and Informatics",
      "Laws and Ethics in Information Technology",
      "Database Systems",
      "Database Systems Laboratory",
      "Abstract Data Types and Problem Solving",
      "Algorithm Design and Analysis",
      "Programming Skills Development Laboratory",
      "Software Engineering",
      "Discrete Mathematics",
      "Probability and Statistics for Informatics",
      "Data Communications and Computer Networks",
      "Operating Systems",
      "Electronics for Computer Engineers",
      "Electronics Laboratory for Computer Engineers",
      "Digital Systems  LDesign",
      "Logic Circuitaboratory",
      "Computer Architecture and Organization",
      "Introduction to Embedded Systems",
      "Embedded Systems Laboratory",
      "Exploratory Project in Computing"
      "Seminar",
      "Internetworking with TCP/IP",
      "Wireless and Mobile Networks",
      "Network Programming",
      "Computer Networks Laboratory I",
      "Computer Networks Laboratory II",
      "Computer Security",
      "Mobile Computing",
      "Internet of Things",
      "Functional Programming",
      "Cloud Computing",
      "Web Application Development",
      "Mobile Application Development",
      "Object-Oriented Analysis and Design",
      "User Experience Design",
      "Computer Game Development",
      "Introduction to Data Science",
      "Data Mining",
      "Artificial Intelligence",
      "Statistical Learning",
      "Biologically-Inspired Computational Intelligence",
      "Digital Signal Processing for Computer Engineers",
      "Digital Image Processing",
      "Statistical Learning",
      "Computer Vision",
      "Computer Graphics",
      "Computer Game Development",
      "Digital Audio and Computer Music",
      "Computer Engineering and Informatics Project Preparation",
      "Computer Engineering and Informatics Project",
      "Programming Language Concepts",
      "Embedded Systems Interfacing",
      "Selected Topics in Computer Engineering and Informatics",
      "Co-operative Education Preparation",
      "Co-operative Education",
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: itemss);
      },
    );

    if (results != null) {
      setState(() {
        _selectedItemsBasicsubject = results;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  List<String> selected = [];

  //DashboardViewModel _viewModel = new DashboardViewModel();
  ViewModel _viewModel = new ViewModel();
  //late Map<String,dynamic> update_data;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: const EdgeInsets.only(top: 30,left: 30,right: 30,bottom: 20),
      decoration: decorationpop(),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _title(),
            const SizedBox(height: 20),
            Row(children: [
              _subjectcode(),
              const SizedBox(width: 10),
              _caditvalue()
            ]),
            const SizedBox(height: 10),
            _subject(),
            const SizedBox(height: 10),
            _teacher(),
            const SizedBox(height: 10),
            _basicSubject(),
            const SizedBox(height: 30),
            _button(),
          ],
        ),
      ),
    );
  }

  Text _title() {
    return const Text(
      "เพิ่มรายวิชา",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Expanded _subjectcode() {
    return Expanded(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "รหัสวิชา",
              style: textStylehintbold()
            ),
          ),
          TextFormField(
            // maxLength: 11,
            validator: (value) {
              if(value!.isEmpty) {
                return "กรุณากรอกรหัสวิชาให้ถูกด้อง";
              }
              else if(!value.contains("-") || value.characters.length != 11)
                // ignore: curly_braces_in_flow_control_structures
                return "กรุณากรอกรหัสวิชาให้ถูกด้อง";
              
              return null;
            },
            controller: coursecodeC,
            keyboardType: TextInputType.number,
            cursorColor: const Color.fromRGBO(172, 173, 191, 1),
            decoration: inputdecorationtext(),
          ),
        ],
      ),
    );
  }

  Expanded _caditvalue() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              "หน่วยกิต",
              style: textStylehintbold()
            ),
          ),
          DropdownButtonFormField(
              hint: Text(
                "เลือก",
                style: textStylehint(),
              ),
              validator: (value) {
                if (value == null) {
                  return "กรุณาเลือกหน่วยกิต";
                }
                return null;
              },
              // decoration: const InputDecoration(
              //   border: InputBorder.none,
              //   contentPadding: EdgeInsets.all(15),
              // ),
              decoration: inputdecorationtext(),
              focusColor: Colors.white,
              dropdownColor: Colors.white,
              // isExpanded: false,
              value: creditValue,
              items: credit
                  .map((e) => DropdownMenuItem<String>(
                      value: e.title, child: Text(e.title!,
                      style: textStylehint(),)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  creditValue = value.toString();
                });
              }),
        ],
      ),
    );
  }

  Column _subject() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            "ชื่อรายวิชา",
            style: textStyleHeadDrop(),
          ),
        ),
        TextFormField(
          validator: (value) {
              if(value!.isEmpty) {
                return "กรุณากรอกชื่อรายวิชาให้ถูกด้อง";
              }
              return null;
            },
          controller: coursenameC,
          keyboardType: TextInputType.number,
          cursorColor: const Color.fromRGBO(172, 173, 191, 1),
          decoration: inputdecorationtext(),
        ),
      ],
    );
  }

  Column _teacher() {
    return Column(
      children: [
        Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "อาจารย์ผู้สอน",
                  style: textStylehintbold(),
                ),
              ),
        Container(
          height: 55,
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: decoration(),
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                _showMultiSelectTeacher();
              }, child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'อาจารย์ผู้สอน',style: textStylehint()),
              )),
              
            ],
          ),
        ),
        SizedBox(height: 5),
        Wrap(
              clipBehavior: Clip.none,
              spacing: 2,
              children: _selectedItemsTeacher
          .map((e) => Container(
            padding: EdgeInsets.all(5),
            decoration: decorationgc(),
            child: Text(e)))
          .toList(),
                            )
      ],
    );
  }

  Column _basicSubject() {
    return Column(
                    children: [
                      Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "วิชาพื้นฐาน",
                                style: textStylehintbold(),
                              ),
                            ),
                      Container(
                        height: 55,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: decoration(),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {
                              _showMultiSelectBasicsubject();
                            }, child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'เลือกวิชาพื้นฐาน',style: textStylehint()),
                            )),
                            
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Wrap(
                            clipBehavior: Clip.none,
                            spacing: 2,
                            children: _selectedItemsBasicsubject
                        .map((e) => Container(
                          padding: EdgeInsets.all(5),
                          decoration: decorationgc(),
                          child: Text(e)))
                        .toList(),
                                          )
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
                _viewModel.adddata("รหัสวิชา",coursecodeC.text);
                _viewModel.adddata("ชื่อราชวิชาภาษาอังกฤษ",coursenameC.text);
                _viewModel.adddata("หน่วยกิต",creditValue.toString());
                _viewModel.adddata("วิชาพื้นฐาน",[basicsubjectValue.toString()]);
                _viewModel.adddata("อาจารย์ผู้สอน",[teachernameValue.toString()]);
                if(_formKey.currentState!.validate()) {
                  //print("Validated");
                  //print(_viewModel.update_data);
                  updates_data("Update_Subject",_viewModel.update_data);
                  Navigator.pop(context);
                } else {
                  print("Not Validated");
                }
                // print(coursecodeC.text);
                // print(coursenameC.text);
                // print(creditValue.toString());
                // print(basicsubjectValue.toString());
                // print(teachernameValue.toString());
                print(_selectedItemsBasicsubject);
                print(_selectedItemsTeacher);
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
}

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  final List<String> _selectedItems = [];

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item,style: textStylehint(),),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) 
                    { setState(() {
                      _itemChange(item, isChecked!);
                    });
                      },
                  ))
              .toList(),
        ),
      ),
      actions: [
        Container(
          decoration: decorationredborder(),
          child: TextButton(
            onPressed: _cancel,
            child: Text('ยกเลิก',
            style: textStylered(),),
          ),
        ),
        Container(
          padding: EdgeInsets.all(2),
          decoration: decorationgreen(),
          child: TextButton(
            onPressed: _submit,
            child: Text('ตกลง',
            style: textStylewhite()),
          ),
        ),
      ],
    );
  }
}

