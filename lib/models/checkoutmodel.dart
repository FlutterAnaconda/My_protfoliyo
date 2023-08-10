import 'package:flutter/material.dart';

class CheckoutModel {
  String label;
  TextEditingController controller;
  bool isDone;

  CheckoutModel(this.label, this.controller, {this.isDone = false});
}
