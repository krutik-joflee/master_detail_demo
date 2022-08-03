// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatelessWidget {
  ItemDetailsScreen(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.isInTabletLayout})
      : super(key: key);

  final String title;
  final String subtitle;
  final bool isInTabletLayout;

  @override
  Widget build(BuildContext context) {
    if (isInTabletLayout) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(title), Text(subtitle)],
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(title), Text(subtitle)],
      )),
    );
  }
}
