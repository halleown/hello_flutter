import 'package:flutter/material.dart';


// 基础widget，指单个控件
class MyBasicPage extends StatefulWidget {
  MyBasicPage({super.key});

  @override
  State<MyBasicPage> createState() => _MyBasicPageState();
}

class _MyBasicPageState extends State<MyBasicPage> {
  // 两个控件共有一个状态
  bool _isChecked = false;
  // 密码输入框文本选择
  final TextEditingController _pwdcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('基础组件'), backgroundColor: Colors.grey),
      body: Container(
        child: Column(
          children: [
            showText(),
            showSplitLine(),
            showButton(),
            showSplitLine(),
            showImage(),
            showSplitLine(),
            showSwitch(),
            showSplitLine(),
            showLogin(),
            showSplitLine(),
          ],
        ),
      ),
    );
  }

  Widget showSplitLine() {
    return Text('---------------------------------------------');
  }

  // 文本：Text、TextStyle、TextSpan、DefaultTextStyle
  Widget showText({String msg = "文本1111"}) {
    return Column(
      spacing: 7,
      children: [
        Text(msg, textAlign: TextAlign.start),
        Text('文本1' * 10, textAlign: TextAlign.end),
      ],
    );
  }

  // 按钮：ElevatedButton、TextButton、OutlinedButton、IconButton
  Widget showButton() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: TextButton(onPressed: () {}, child: Text('子按钮')),
        ),
        TextButton(onPressed: () {}, child: Text('文本按钮')),
        OutlinedButton(onPressed: () {}, child: Text('outlinebutton')),
        IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up)),
        // TextButton(
        //   onPressed: () {},
        //   icon: Icon(IconData(0xefe7, fontFamily: 'MaterialIcons')),
        // ),
        ElevatedButton.icon(
          onPressed: () {},
          label: Text('发送'),
          icon: Icon(Icons.ac_unit),
        ),
      ],
    );
  }

  // 图片：Image、AssetImage、NetworkImage
  Widget showImage() {
    return Column(
      children: [
        Image(
          width: 50,
          height: 50,
          image: NetworkImage(
            "https://book.flutterchina.club/assets/img/logo.png",
            scale: 0.1,
          ),
        ),
      ],
    );
  }

  // checkbox和switch
  Widget showSwitch() {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              activeColor: Colors.red,
              value: _isChecked,
              onChanged: (bool? newValue) {
                setState(() {
                  _isChecked = newValue!;
                });
              },
            ),
            Switch(
              value: _isChecked,
              onChanged: (bool isSwitch) {
                if (isSwitch) {
                  _pwdcontroller.text = '测试文本';
                  _pwdcontroller.selection = TextSelection(
                    baseOffset: 1,
                    extentOffset: _pwdcontroller.text.length,
                  );
                }
                setState(() {
                  _isChecked = isSwitch;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  // 获取输入框文本
  Widget showLogin() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            labelText: '用户名',
            hintText: '用户名或邮箱',
          ),
          autofocus: true,
          onChanged: (value) => print('用户名：$value'),
        ),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: '密码',
            hintText: '用户密码',
          ),
          controller: _pwdcontroller,
        ),
      ],
    );
  }

  @override
  void initState() {
    _pwdcontroller.addListener(() {
      print('密码：${_pwdcontroller.text}');
    });
  }
}
