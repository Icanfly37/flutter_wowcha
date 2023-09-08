import 'package:flutter/material.dart';
import 'package:ku_t/Friend/Dropdown/BasicsubjectModel.dart';
import 'package:ku_t/Friend/Dropdown/CraditModel.dart';
import 'package:ku_t/Friend/Dropdown/TeachernameModel.dart';
import 'package:ku_t/Friend/modules/component/Header_web.dart';
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
            child: const Text(
              "รหัสวิชา",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(230, 230, 230, 1),
                borderRadius: BorderRadius.circular(15)),
            child: TextFormField(
              controller: coursecodeC,
              keyboardType: TextInputType.number,
              cursorColor: const Color.fromRGBO(172, 173, 191, 1),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 14),
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
            child: const Text(
              "หน่วยกิต",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromRGBO(230, 230, 230, 1),
                borderRadius: BorderRadius.circular(15)),
            child: DropdownButtonFormField(
                hint: const Text(
                  "เลือก",
                  style: TextStyle(
                    // color: Color.fromRGBO(172, 173, 191, 1),
                    fontSize: 14,
                  ),
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
                        value: e.title, child: Text(e.title!)))
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
          child: const Text(
            "ชื่อรายวิชา",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          // width: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(230, 230, 230, 1),
              borderRadius: BorderRadius.circular(15)),
          child: TextFormField(
            controller: coursenameC,
            keyboardType: TextInputType.number,
            cursorColor: const Color.fromRGBO(172, 173, 191, 1),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 14),
              hintText: "ชื่อรายวิชา",
              // hintStyle: textStyle16(),
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
          child: const Text(
            "อาจารย์ผู้สอน",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(230, 230, 230, 1),
              borderRadius: BorderRadius.circular(15)),
          child: DropdownButtonFormField(
              hint: const Text(
                "อาจารย์ผู้สอน",
                style: TextStyle(
                  // color: Color.fromRGBO(172, 173, 191, 1),
                  fontSize: 14,
                ),
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
                      value: e.title, child: Text(e.title!)))
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
          child: const Text(
            "วิชาพื้นฐาน",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(230, 230, 230, 1),
              borderRadius: BorderRadius.circular(15)),
          child: DropdownButtonFormField(
              hint: const Text(
                "วิชาพื้นฐาน",
                style: TextStyle(
                  // color: Color.fromRGBO(172, 173, 191, 1),
                  fontSize: 14,
                ),
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
                      value: e.title, child: Text(e.title!)))
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(0, 102, 94, 1)),
            child: TextButton(
              onPressed: () {
                model.coursecodeCText = coursenameC.text;
                model.coursenameCText = coursenameC.text;
                _viewModel.adddata(model: model, context: context);
              },
              child: const Text(
                "ตกลง",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14),
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: const Color.fromRGBO(255, 93, 93, 1), width: 2),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "ยกเลิก",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 93, 93, 1),
                    fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
