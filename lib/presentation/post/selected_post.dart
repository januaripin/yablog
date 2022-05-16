import 'package:flutter/material.dart';

class SelectedPost extends ValueNotifier<int> {
  SelectedPost._createInstance() : super(-1);

  static final SelectedPost _instance = SelectedPost._createInstance();

  factory SelectedPost() => _instance;

  void select(int atIndex) {
    value = atIndex;
  }

  void unselect() {
    value = -1;
  }
}
