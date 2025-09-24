// 一个页面
import 'package:hello_flutter/tapbox.dart';
import 'package:flutter/material.dart';

class MyPageOne extends StatelessWidget {
  const MyPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('MyPageOne'),
      ),
      body: Row(
        children: [
          const Text('第0个text'),
          Column(
            children: [
              const Text('第一个text'),
              const Text(
                '第二个text',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          ParentWidget(),
        ],
      ),
    );
  }
}
