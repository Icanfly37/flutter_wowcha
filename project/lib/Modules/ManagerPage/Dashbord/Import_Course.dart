import 'package:flutter/material.dart';

class Import_View extends StatefulWidget {
  const Import_View({super.key});

  @override
  State<Import_View> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Import_View> {

  late TextEditingController controller;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //_header(),
          const Divider(height: 30),
          Container(
            child: orientation == Orientation.portrait //short if/else
            ? Column(
                //is if
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      //_year(),
                      //_selectYear(),
                      SizedBox(height: 10),
                      //_SearchSubject(),
                      SizedBox(height: 10),
                      //_ButtonSubject(),
                      SizedBox(height: 10),
                      //_ButtonAdd(),
                      SizedBox(height: 10),
                      //_importSubject()
                    ],
                  )
                ],
              )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //_year(),
                    const SizedBox(height: 2),
                    //_selectYear(),
                  ],
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //_SearchSubject(),
                      Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 70,
                            )
                          ),
                          /*Expanded(child: _ButtonSubject()),
                          const SizedBox(width: 10),
                          Expanded(child: _ButtonAdd()),
                          const SizedBox(width: 10),
                          Expanded(child: _importSubject())*/
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}