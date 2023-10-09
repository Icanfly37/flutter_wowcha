import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/Dropdown/DaysModel.dart';
import 'package:ku_t/Modules/Dropdown/TimeEndModel.dart';
import 'package:ku_t/Modules/Dropdown/TimeStartModel.dart';
import 'package:unicons/unicons.dart';

class HomeScreen extends StatefulWidget {
  final String taskId;

  const HomeScreen({Key? key, required this.taskId}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TextEditingController> _studygroup = [];
  final List<TextEditingController> _numberopen = [];
  final List<TextEditingController> _room = [];
  final List<String?> _daysvalue = [];
  final List<String?> _timeStartvalue = [];
  final List<String?> _timeEndvalue = [];
  List<String> _selectedItems = [];
  final _formKeyyy = GlobalKey<FormState>();

  int number = 1;

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
      _room.add(TextEditingController());
      _daysvalue.add(null);
      _timeStartvalue.add(null);
      _timeEndvalue.add(null);
      _selectedItems.add('');
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
      _selectedItems.removeAt(i);
    });
  }

  void _submit() {
    final isValid = _formKeyyy.currentState!.validate();
    if (!isValid) {
      return;
    }
    print(_studygroup.toList());
    print(_room.toList());
    print(_numberopen.toList());
    print(_daysvalue.toList());
    print(_timeStartvalue.toList());
    print(_timeEndvalue.toList());
    print(_selectedItems.toList());

    _formKeyyy.currentState!.save();

    for (int i = 0; i < _studygroup.length; i++) {
      String studygroup = _studygroup[i].text;
      String numberopen = _numberopen[i].text;
      String room = _room[i].text;
      String? daysvalue = _daysvalue[i]; 
      String? timeStartvalue = _timeStartvalue[i];
      String? timeEndvalue = _timeEndvalue[i]; 
      String? selectedItems = _selectedItems[i]; 
    }
  }

  

  void _showMultiSelect() async {
    final List<String> items = [
      'T12-1',
      'T12-2',
      'T12-3',
      'T12-4',
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
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
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "ห้อง",
                                style: textStylehintbold(),
                              ),
                            ),
                            TextFormField(
                              controller: _room[index],
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
                  const SizedBox(height: 10),
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
                        height: 55,
                        decoration: decoration(),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextButton(onPressed: () {
                                _showMultiSelect();
                              }, child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'เลือกชั้นปีที่เปิดรับ',style: textStylehint()),
                              )),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Wrap(
                                                    clipBehavior: Clip.none,
                                                    spacing: 2,
                                                    children: _selectedItems
                                .map((e) => Text(e))
                                .toList(),
                                                  ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
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
        TextButton(
          onPressed: _cancel,
          child: const Text('ยกเลิก'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('ตกลง'),
        ),
      ],
    );
  }
}
