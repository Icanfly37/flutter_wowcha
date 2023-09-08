import 'package:flutter/material.dart';
import 'package:ku_t/Friend/modules/component/Header_web.dart';

class SearchBarWidget extends StatefulWidget{
  final bool isReadOnly;
  final bool hasBackButton;
  const SearchBarWidget({
    Key? key,
    required this.isReadOnly,
    required this.hasBackButton, 
  })  : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "ค้นหารายวิชา",
            style: textStyleHeadDrop(),
          ),
        ),
        Container(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(230, 230, 230, 1),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: TextField(
                            onTap: () {
                            },
                            cursorColor: Color.fromRGBO(172, 173, 191, 1),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: textStylehint(),
                              hintText: "รหัสวิชา / ชื่อรายวิชา",
                              contentPadding: const EdgeInsets.all(15),
                            ),
                          ),
                        ),
              ),
              SizedBox(width: 10,),
                      Container(
                        width: 70,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(0, 102, 94, 1)),
                        child: TextButton(
                          
                          onPressed: () {  },
                          child: Text('ค้นหา',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14
                          ),),
                        ),
                        ),
            ],
          ),
        ),
      ],
    );
  }
}
