import 'package:flutter/material.dart';

class FocusNodeStore {
  final FocusNode focusNode = FocusNode();

  void onShowModal() {
    focusNode.requestFocus();
  }

  void onCloseModal() {
    focusNode.unfocus();
  }
}
