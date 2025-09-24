// import 'dart:ffi';

import 'package:flutter/material.dart';

// 布局类widget，分配多个widget的位置，
// 容器类widget，用于限制基础widget的大小、颜色、背景做装饰用
class MyLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:
            // showConstrainedLayout()
            // showLinearLayout(),
            // showLinearLayout(),
            // showFlexLayout(),
            // showSteamLayout(),
            // showStackLayout(),
            showLayout1(),
      ),
    );
  }

  Widget showBox({
    double width = 100,
    double height = 80,
    Color color = Colors.red,
  }) {
    return Container(width: width, height: height, color: color);
  }

  // 约束布局
  Widget showConstrainedLayout() {
    Widget redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

    // 一个组件（redBox）有一个父级ConstrainedBox限制
    // return ConstrainedBox(
    //   constraints: BoxConstraints(minHeight: 30, minWidth: double.infinity),
    //   child: Container(height: 70, child: redBox),
    // );

    // SizedBox实际上是ConstrainedBox固定宽高，但代码中它两没有关系
    // return SizedBox(width: 200, height: 200, child: redBox);

    // 一个组件有多个父级ConstrainedBox限制（最小宽高）
    //    结论：当一个组件有多个父级ConstainedBox限制最小宽高时，取最大的宽高，保证父子约束不冲突
    // return ConstrainedBox(
    //   constraints: BoxConstraints(minWidth: 50, minHeight: 180), // 父约束
    //   child: ConstrainedBox(
    //     constraints: BoxConstraints(minWidth: 90, minHeight: 20), // 子约束1
    //     child: ConstrainedBox(
    //       constraints: BoxConstraints(minWidth: 250, minHeight: 30),// 子约束2
    //       child: redBox,
    //     ),
    //   ),
    // );

    // 一个组件有多个父级ConstrainedBox限制（最大宽高）
    //     结论：当一个组件有多个父级ConstrainedBox限制最大宽高时，取最小的宽高
    // return ConstrainedBox(
    //   constraints: BoxConstraints(maxWidth: 150, maxHeight: 100), // 父约束
    //   child: ConstrainedBox(
    //     constraints: BoxConstraints(maxWidth: 50, maxHeight: 200),
    //     // child: redBox, // 由于没指定宽高，所以界面上不会显示
    //     child: Container(height: 300, width: 300, color: Colors.red),
    //   ),
    // );

    // UnConstrainedBox
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 150, minHeight: 100),
                child: UnconstrainedBox(
                  child: Container(width: 50, height: 70, color: Colors.red),
                ),
              ),
              Text('aaaaa'),
            ],
          ),
          Text('bbbbb'),
        ],
      ),
    );
  }

  // 线性布局
  Widget showLinearLayout() {
    // return Row(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [Text('aabb'), Text('aaa', style: TextStyle(fontSize: 32),)],
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.baseline,
    //   textBaseline: TextBaseline.ideographic,
    // );

    // return ConstrainedBox(
    //   constraints: BoxConstraints(minWidth: double.infinity),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [Text('2josdj'), Text('adojo3h3333333o')],
    //   ),
    // );

    // row嵌套row，里层的row的MainAxisSize.max不会生效，要想生效，使用expanded将里层row包裹起来
    return Container(
      color: Colors.amber,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [Text('11111')],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 弹性布局
  Widget showFlexLayout() {
    // 1:2的box
    return Row(
      children: [
        // expaned只能作为flex的孩子
        Expanded(flex: 1, child: Container(height: 30, color: Colors.red)),
        Expanded(flex: 2, child: Container(height: 30, color: Colors.grey)),
        Spacer(),
      ],
    );
  }

  // todo 流式布局
  // Widget showSteamLayout() {
  //   // return Wrap(children: [Text("x" * 10), Text("y" * 10)], spacing: 20);

  //   return Flow(delegate: ,);
  // }

  // 层叠布局：stack、positioned
  Widget showStackLayout() {
    // return ConstrainedBox(constraints: BoxConstraints.expand(), child: Stack(children: [
    //   Positioned(child: showBox(color: Colors.teal), top: 20,),
    //   Positioned(child: showBox(color: Colors.black), left: 20,),
    //   Positioned(child: showBox(color: Colors.green), right: 20,),
    //   Positioned(child: showBox(color: Colors.grey), bottom: 20,),
    // ],));
    return Stack(
      alignment: AlignmentDirectional.center,
      fit: StackFit.passthrough,
      children: [
        showBox(),
        Positioned(child: showBox(color: Colors.green), top: 20),
      ],
    );
  }

  // LayoutBuilder：获取父布局约束信息
  Widget showLayout1() {
    var list = List.filled(2 * 3, showBox(width: 40, height: 40));
    // 单行显示
    return SizedBox(width: 90, child: MyCustomLayout(chrlid: list));
    // 多行显示
    // return SizedBox(width: 110, child: MyCustomLayout(chrlid: list));
  }
}

// 自定义一个布局，当子元素宽度小于100时，显示为一行，否则显示两行
class MyCustomLayout extends StatelessWidget {
  // 用一个数组接收子元素
  List<Widget> chrlid;

  MyCustomLayout({required this.chrlid});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        if (constrains.maxWidth < 100) {
          // 显示单列
          return Column(
            children: chrlid,
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
          );
        }

        // 显示多列（所有子元素的宽度加起来超过100时，两行排列）
        List<Widget> _child = [];
        for (var i = 0; i < chrlid.length; i += 2) {
          _child.add(
            Row(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              children: [chrlid[i], chrlid[i + 1]],
            ),
          );
        }

        return Column(
          children: _child,
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
        );
      },
    );
  }
}
