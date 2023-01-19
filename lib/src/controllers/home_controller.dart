import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:report_system_admin/src/collections/collections.dart';

class HomeController extends ChangeNotifier{
  bool loading=false;

  Stream reportStream(){
    return Collections.reportCollection.snapshots();
  }
}