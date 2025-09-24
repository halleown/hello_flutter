import 'package:flutter/material.dart';

class MyScollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // show(),
          show1(),
    );
  }

  Widget show() {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Container(
      width: double.infinity,
      height: 200,
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: str
                  .split("")
                  .map((text) => Text(text, textScaler: TextScaler.linear(2)))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  // listview
  Widget show1() {
    String text = "111";
    // return ListView(children: text.split("").map((a) => Text(a)).toList());
    // return ListView.builder(
    //   itemCount: 30,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Text('$index');
    //   },
    // );

    Widget line1 = Divider(color: Colors.black);
    Widget line2 = Divider(color: Colors.blue);

    return ListView.separated(
      itemBuilder: (_, index) {
        return Text('$index');
      },
      separatorBuilder: (_, i) {
        // return Container(height: 2, color: Colors.black);
        return i % 2 == 0 ? line1 : line2;
      },
      itemCount: 30,
    );
  }
}
