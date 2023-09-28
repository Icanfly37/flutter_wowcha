import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:ku_t/Modules/Component/Header_web.dart';
import 'package:ku_t/Modules/Data/SubjectsList.dart';
// import 'package:ku_t/Modules/Componemt/Header_web.dart';

//แก้ Search Bar ให้สามารถขึ้นคำแนะนำเวลาค้นหาได้

class SearchBarWidget extends StatefulWidget {
  final bool isReadOnly;
  final bool hasBackButton;
  const SearchBarWidget({
    Key? key,
    required this.isReadOnly,
    required this.hasBackButton,
  }) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      // children: [
      //   Container(
      //     child: Text(
      //       "ค้นหารายวิชา",
      //       style: textStyleHeadDrop(),
      //     ),
      //   ),
      //   Container(
      //     child: Row(
      //       children: [
      //         Expanded(
      //           child: Container(
      //             width: MediaQuery.of(context).size.height,
      //             decoration: BoxDecoration(
      //                 color: Color.fromRGBO(230, 230, 230, 1),
      //                 borderRadius: BorderRadius.circular(15)),
      //             child: TextField(
      //               onTap: () {},
      //               cursorColor: Color.fromRGBO(172, 173, 191, 1),
      //               decoration: InputDecoration(
      //                 border: InputBorder.none,
      //                 hintStyle: textStylehint(),
      //                 hintText: "รหัสวิชา / ชื่อรายวิชา",
      //                 contentPadding: const EdgeInsets.all(15),
      //               ),
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           width: 10,
      //         ),
      //         Container(
      //           width: 70,
      //           padding: EdgeInsets.symmetric(vertical: 8),
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(15),
      //               color: Color.fromRGBO(0, 102, 94, 1)),
      //           child: TextButton(
      //             onPressed: () {},
      //             child: Text(
      //               'ค้นหา',
      //               style: TextStyle(
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.white,
      //                   fontSize: 14),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ],

      ///
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
                // cursorColor: const Color.fromRGBO(172, 173, 191, 1),
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
      ],
    );
  }
}
