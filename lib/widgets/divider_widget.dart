import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Divider(),
      ),
    );
  }
}
