import 'package:flutter/material.dart';

class MyContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // show1()
          // show2()
          show3(),
    );
  }

  Widget show1() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(width: 50, height: 50, color: Colors.redAccent),
        ),
        Container(width: 50, height: 50, color: Colors.grey),
        // 装饰容器
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.grey]),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Text('按钮'),
          ),
        ),
      ],
    );
  }

  //
  Widget show2() {
    return Row(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.orangeAccent),
          // child: Transform.translate(
          //   offset: Offset(5, 5),
          //   child: Text('Hello'),
          // ),
          child: RotatedBox(quarterTurns: 5, child: Text('hi111')),
        ),
        Text('world'),
      ],
    );
  }

  Widget show3() {
    var image = Image.network(
      "https://book.flutterchina.club/assets/img/book2.73e63aa4.jpeg",
      width: 100,
      fit: BoxFit.fitHeight,
    );
    return Column(
      children: [
        image,
        ClipOval(child: image),
        ClipRect(child: image),
        ClipRect(clipper: MyClipper(), child: image,)
      ],
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(30.0, 35.0, 30.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}