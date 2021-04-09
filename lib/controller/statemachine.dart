import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

class StateMachine {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void updateOne(){
    print(1);
    _database.reference().child("status").child("state").set(1);
  }
  void updateZero(){
    print(0);
    _database.reference().child("status").child("state").set(0);
  }
}