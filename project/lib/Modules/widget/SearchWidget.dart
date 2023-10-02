import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/Data/SubjectsList.dart';

//แก้ Search Bar ให้สามารถขึ้นคำแนะนำเวลาค้นหาได้

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  TextEditingController _searchController = TextEditingController();

  // List<String> subjects = [
  //   '01417167 Engineering Mathematics I',
  //   '01420111 General Physics I',
  //   '01420113 Laboratory in Physics I',
  //   '01999111 Knowledge of the Land',
  //   '03603111 Programming Fundamentals I',
  //   '03604111 Engineering Drawing'
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text("ค้นหารายวิชา", style: textStylehintbold()),
        ),
        Row(children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              // width: 300,
              height: 50,
              decoration: decoration(),
              child: AutoCompleteTextField<String>(
                key: key,
                controller: _searchController,
                clearOnSubmit: false,
                suggestions: subjects,
                itemBuilder: (context, suggestion) => ListTile(
                  title: Text(suggestion),
                ),
                itemFilter: (item, query) =>
                    item.toLowerCase().contains(query.toLowerCase()),
                itemSorter: (a, b) => a.compareTo(b),
                itemSubmitted: (item) {
                  setState(() {
                    _searchController.text = item;
                  });
                },
                style: const TextStyle(fontSize: 15),
                cursorColor: const Color.fromRGBO(172, 173, 191, 1),
                decoration: InputDecoration(
                  hintText: 'รหัสวิชา / ชื่อรายวิชา',
                  hintStyle: textStylehint(),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromRGBO(157, 157, 157, 1),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(15),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              Container(
                height: 50,
                width: 80,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: decorationgreen(),
                child: TextButton(
                  onPressed: () {
                    String searchTerm = _searchController.text;
                    print('ค้นหา: $searchTerm');
                  },
                  child: Text(
                    'ค้นหา',
                    style: textStylewhite(),
                  ),
                ),
              ),
            ],
          )
        ])

        // padding: const EdgeInsets.all(16.0),

        // ElevatedButton(
        // onPressed: () {
        //   String searchTerm = _searchController.text;
        //   print('ค้นหา: $searchTerm');
        // },
        //   child: Text('ค้นหา'),
        // ),
      ],
    );
  }
}
