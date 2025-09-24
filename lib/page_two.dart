import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'App Name',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 30),
            child: Icon(Icons.share, color: Colors.white, size: 20),
          ),
        ],
      ),
      drawer: MyDrawer(),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //   ],
      // ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home),
            SizedBox(),
            Icon(Icons.home)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {print('111111')},
        child: Icon(Icons.add),
      ),
    );
  }
}

// 抽屉菜单
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              // todo 裁切图片，切成30x30的圆形图片
              ClipOval(
                clipper: MyCustomClip(),
                child: Image.network(
                  'https://book.flutterchina.club/assets/img/3-11.a063365a.png',
                  color: Colors.amber,
                ),
              ),
              Text('Your name'),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: Icon(Icons.add), flex: 1),
              Expanded(child: Text('add account'), flex: 3),
            ],
          ),
          Row(
            children: [
              Expanded(child: Icon(Icons.settings), flex: 1),
              Expanded(child: Text('account manage'), flex: 3),
            ],
          ),
        ],
      ),
    );
  }
}

// 切图
class MyCustomClip extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCenter(center: Offset(50, 50), width: 50, height: 50);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
