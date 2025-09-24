// 父Widget管理子Widget的状态
import 'package:flutter/material.dart';

// box不管理状态，所以继承lesswidget
class TapBoxB extends StatelessWidget {
  bool active;
  // todo --------------------????
  ValueChanged<bool> onChange;

  TapBoxB({this.active = false, required this.onChange});

  void _handle() {
    onChange(!active);
  }

  @override
  Widget build(BuildContext context) {
  // 点击box，改变盒子颜色
    return GestureDetector(
      onTap: _handle,
      child: Container(
        width: 80,
        height: 80,
        color: active
            ? Colors.red
            : Colors.blue,
        child: Center(child: const Text('BoxB')),
      ),
    );
  }
}

// 父widget
class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ParentState();
}

class _ParentState extends State<ParentWidget> {
  bool _active = false;

  void _handleOnchange(bool active) {
    setState(() {
      _active = active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxB(active: _active, onChange: _handleOnchange),
    );
  }
}
