// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

import 'item_details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DEMO"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) => CommonTextCard(
              index: index + 1,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ItemDetailsScreen(
                              isInTabletLayout: false,
                              subtitle: "This is the ${index + 1} screen",
                              title: 'item ${index + 1}',
                            )));
              }),
          itemCount: 10,
        ),
      ),
    );
  }

  int tempIndex = 1;

  Widget _buildTabletLayout() {
    // For tablets, return a layout that has item listing on the left
    // and item details on the right.

    return Scaffold(
      body: Row(
        children: [
          Flexible(
              flex: 1,
              child: Scaffold(
                body: Center(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CommonTextCard(
                        index: index + 1,
                        onTap: () {
                          tempIndex = index + 1;
                          setState(() {});
                        },
                      );
                    },
                    itemCount: 10,
                  ),
                ),
              )),
          // ignore: prefer_const_constructors
          Flexible(
            flex: 3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('item $tempIndex'),
                  Text('This is the ${tempIndex} screen'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;
    if (useMobileLayout) {
      return _buildMobileLayout();
    }
    return _buildTabletLayout();
  }
}

class CommonTextCard extends StatelessWidget {
  const CommonTextCard({Key? key, required this.index, required this.onTap})
      : super(key: key);

  final int index;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text("item $index"),
    );
  }
}
