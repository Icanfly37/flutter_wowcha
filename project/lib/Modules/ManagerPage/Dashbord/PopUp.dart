import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Componemt/Header_web.dart';
import 'package:ku_t/Modules/Dropdown/BasicsubjectModel.dart';
import 'package:ku_t/Modules/Dropdown/CraditModel.dart';
import 'package:ku_t/Modules/Dropdown/TeachernameModel.dart';
import 'package:ku_t/Modules/ManagerPage/Dashbord/Dashbord_Model.dart';
import 'package:ku_t/Modules/ManagerPage/Dashbord/Dashbord_ViewModel.dart';

class PopupManagerView extends StatefulWidget {
  const PopupManagerView({super.key});

  @override
  State<PopupManagerView> createState() => _PopupManagerViewState();
}

class _PopupManagerViewState extends State<PopupManagerView> {
  TextEditingController coursecodeC = TextEditingController(); //y
  TextEditingController coursenameC = TextEditingController();

  DashbordModel model = DashbordModel(
      basicsubjectValue: null,
      coursecodeCText: null,
      coursenameCText: null,
      creditValue: null,
      teachernameValue: null);

  @override
  void dispose() {
    coursecodeC.dispose();
    coursenameC.dispose();
    
    super.dispose();
  }

  DashboardViewModel _viewModel = new DashboardViewModel();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      decoration: decorationpop(),
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
          _button()
        ],
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
              style: textStyleHeadDrop()
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.height,
            decoration: decoration(),
            child: TextFormField(
              controller: coursecodeC,
              keyboardType: TextInputType.number,
              cursorColor: const Color.fromRGBO(172, 173, 191, 1),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: textStylehint(),
                hintText: "รหัสวิชา",
                // hintStyle: textStyle16(),
                contentPadding: EdgeInsets.all(15),
              ),
            ),
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
              style: textStyleHeadDrop()
            ),
          ),
          Container(
            decoration: decoration(),
            child: DropdownButtonFormField(
                hint: Text(
                  "เลือก",
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
                value: model.creditValue,
                items: credit
                    .map((e) => DropdownMenuItem<String>(
                        value: e.title, child: Text(e.title!,
                        style: textStylehint(),)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    model.creditValue = value.toString();
                  });
                }),
          ),
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
        Container(
          // width: MediaQuery.of(context).size.height,
          decoration: decoration(),
          child: TextFormField(
            controller: coursenameC,
            keyboardType: TextInputType.number,
            cursorColor: const Color.fromRGBO(172, 173, 191, 1),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: textStylehint(),
              hintText: "ชื่อรายวิชา",
              contentPadding: EdgeInsets.all(15),
            ),
          ),
        ),
      ],
    );
  }

  Column _teacher() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            "อาจารย์ผู้สอน",
            style: textStyleHeadDrop(),
          ),
        ),
        Container(
          decoration: decoration(),
          child: DropdownButtonFormField(
              hint: Text(
                "อาจารย์ผู้สอน",
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
              value: model.teachernameValue,
              items: teachername
                  .map((e) => DropdownMenuItem<String>(
                      value: e.title, child: Text(e.title!,
                      style: textStylehint(),)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  model.teachernameValue = value.toString();
                });
              }),
        ),
      ],
    );
  }

  Column _basicSubject() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            "วิชาพื้นฐาน",
            style: textStyleHeadDrop(),
          ),
        ),
        Container(
          decoration: decoration(),
          child: DropdownButtonFormField(
              hint: Text(
                "วิชาพื้นฐาน",
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
              value: model.basicsubjectValue,
              items: basicsubject //แก้
                  .map((e) => DropdownMenuItem<String>(
                      value: e.title, child: Text(e.title!,
                      style: textStylehint(),)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  model.basicsubjectValue = value.toString();
                });
              }),
        ),
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
                model.coursecodeCText = coursecodeC.text;
                model.coursenameCText = coursenameC.text;
                _viewModel.adddata(model: model, context: context);
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
