import 'package:flutter/material.dart';
import 'package:ku_t/Models/status_db.dart';
import 'package:ku_t/Modules/Component/DynamicTable.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/Component/PaginatedDataTable.dart';
import 'package:ku_t/Modules/Dropdown/YearModel.dart';
import 'package:ku_t/Modules/ManagerPage/Dashbord/PopUp.dart';
import 'package:ku_t/Modules/ManagerPage/Dashbord/viewmodel.dart';
import 'package:ku_t/Modules/widget/SearchWidget.dart';
import 'package:ku_t/Services/apiconnector/callapt.dart';

class DashbordSmall extends StatefulWidget {
  const DashbordSmall({super.key});

  @override
  State<DashbordSmall> createState() => _DashbordSmallState();
}

class _DashbordSmallState extends State<DashbordSmall> {
  // CollectionReference addsubject =
  //     FirebaseFirestore.instance.collection('subject');
  // late TextEditingController controller;
  String? selectedValue; //N

  // bool isImport = true;

  // ถ้า false จะเป็นไม่พบหลักสูตร ถ้า true คือมีข้อมูลหลักสูตรแล้ว (ข้อมูลจะขึ้นในตาราง)
  //var isExist;
  final ViewModel _viewModel = ViewModel();

  @override

  //Future<bool> get_status_db() async {
  //  isExist = await _viewModel.get_status();
  //  return isExist;
  //}

  //TextEditingController coursecodeC = TextEditingController(); //y
  //TextEditingController coursenameC = TextEditingController();

  // @override
  // void dispose() {
  //   controller.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    //print(isExist.toString()+" : Now");
    return FutureBuilder(
        future: _viewModel.get_status(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (_viewModel.status == true) {
              return _show_table(orientation, _foundCourse());
            } else {
              return _show_table(orientation, _notFoundCourse());
            }
          } else {
            return _show_table(orientation, _notFoundCourse());
          }
        });
  }

  Container _header() {
    return Container(
      alignment: Alignment.topLeft,
      child: const Text(
        "การจัดการข้อมูลหลักสูตร",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }

  Padding _show_table(Orientation orientation, Widget table) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          _header(),
          const Divider(height: 26),
          Container(
              child: orientation == Orientation.portrait //short if/else
                  ? Column(
                      //is if
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            _DropdownSelectYear(),
                            const SizedBox(height: 10),
                            SearchWidget(),
                            const SizedBox(height: 18),
                            _ButtonAdd(),
                            const SizedBox(height: 10),
                            _ButtonImportCourse()
                          ],
                        ),
                      ],
                    )
                  : Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _DropdownSelectYear(),
                        const SizedBox(width: 10),
                        // Expanded(flex: 3, child: _SearchSubject()),
                        Expanded(
                          flex: 3,
                          child: SearchWidget(),
                        ),
                        const SizedBox(width: 50),
                        Expanded(child: _ButtonAdd()),
                        const SizedBox(width: 10),
                        Expanded(child: _ButtonImportCourse())
                      ],
                    )),
          // Container(
          //   child: _textCourseStructure(),
          // ),
          // Container(child: table),
          const SizedBox(height: 10),
          Container(
            // child: PaginatedTable(),
            child: DynamicDataTable(),
          ),
        ],
      ),
    );
  }

  Column _DropdownSelectYear() {
    final orientation = MediaQuery.of(context).orientation;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            "ปีหลักสูตร",
            style: textStylehintbold(),
          ),
        ),
        Container(
          width: orientation == Orientation.portrait ? double.infinity : 100,
          height: 50,
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
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              focusColor: Colors.white,
              dropdownColor: Colors.white,
              isExpanded: false,
              value: selectedValue,
              items: year //แก้
                  .map((e) => DropdownMenuItem<String>(
                      value: e.title,
                      child: Text(
                        e.title!,
                        style: textStylehint(),
                      )))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value.toString();
                });
              }),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Container _ButtonImportCourse() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
        margin: orientation == Orientation.portrait
            ? null
            : EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        height: 50,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: decorationborder(),
        child: TextButton(
          onPressed: () {
            print("นำเข้าหลักสูตร");
            Navigator.pushNamed(context, '/import');
          },
          child: Text(
            'นำเข้าหลักสูตร',
            style: textStylegreen(),
          ),
        ));
  }

  // ignore: non_constant_identifier_names
  Container _ButtonAdd() {
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
          onPressed: () {
            openDialog();
          },
          child: Text(
            'เพิ่มรายวิชา',
            style: textStylewhite(),
          ),
        ));
  }

  Container _textCourseStructure() {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(top: 8),
      child: const Text(
        "โครงสร้างรายวิชา",
        // style: textStyleHeadDrop(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Container _notFoundCourse() {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 2),
      height: orientation == Orientation.portrait ? 250 : 460,
      decoration: decorationbordergray(),
      child: Center(
        child: Text(
          'ไม่พบโครงสร้างหลักสูตร!',
          style: textStylegray(),
        ),
      ),
    );
  }

  Container _foundCourse() {
    // return ChangeNotifierProvider(
    //   create: (context) => ItemProvider(),
    //   child: DataTableWithCRUD(),
    return Container(
      child: PaginatedTable(),
    );
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => const Dialog(child: PopupManagerView()));
}
