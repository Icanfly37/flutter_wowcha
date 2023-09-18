import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ku_t/Modules/ManagerPage/Dashbord/Dashbord_Model.dart';

class DashboardViewModel {
  CollectionReference addsubject =
      FirebaseFirestore.instance.collection('subjectt');
  late TextEditingController controller;

  void adddata(
      {required DashbordModel model, required BuildContext context}) async {
    await addsubject.add({
      "coursecode": model.coursecodeCText.toString(),
      "credit": model.creditValue.toString(),
      "coursename": model.coursenameCText.toString(),
      "teachername": model.teachernameValue.toString(),
      "basicsubject": model.basicsubjectValue.toString()
    }).whenComplete(() => Navigator.pop(context));
  }
}
