import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final TextEditingController inputController = TextEditingController();

void delMessage(label) {
  Fluttertoast.showToast(
      msg: '$label was deleted',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.red,
      textColor: Colors.black54,
      fontSize: 16.0);
}

void delLabelItem(context, targetIndex) {
  log(targetIndex.toString());
  FirebaseFirestore.instance
      .collection('todos')
      .doc(targetIndex.id)
      .delete()
      .then((_) {
    print("Delete successful!");
  });
}

void changeIsChecked(indexId, checked) {
  var path = FirebaseFirestore.instance.collection('todos').doc(indexId);
  if (checked == false) {
    log(indexId.toString());
    path.update({
      'isChecked': false,
    });
  } else {
    log(indexId.toString());
    path.update({
      'isChecked': true,
    });
  }
}
