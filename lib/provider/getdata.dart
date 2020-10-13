import 'package:flutter/material.dart';

class ProviderData extends StatelessWidget {
  ProviderData({this.file});
  final file;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Image.file(file)),
    );
  }
}
