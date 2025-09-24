import 'package:flutter/material.dart';

// 无线加载列表
class InfinityListView extends StatefulWidget {
  @override
  _InfinityListViewState createState() => _InfinityListViewState();
}

class _InfinityListViewState extends State<InfinityListView> {
  static const loadingTag = "##loading##"; //表尾标记
  // listview数据源
  var _words = <String>[loadingTag];
  bool flag = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 实现平分显示空间，
      body: Column(
        children: [
          ListTile(title: Text('aaaa')),
          Expanded(child: ListView.separated(
              itemBuilder: (context, i) {
                // 到达下一轮尾部，不一定是结束
                if (_words[i] == loadingTag) {
                  if (_words.length > 50) {
                    return Text('没有数据了');
                  } else {
                    // 显示logading，并加载数据
                    loadData();
                    return Container(
                      padding: EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 30,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('${_words[i]}----${i}'),
                );
              },
              separatorBuilder: (context, i) {
                return Divider(color: Colors.black);
              },
              itemCount: _words.length,
            ),),
          // SizedBox(
          //   height: 200,
          //   child: ListView.separated(
          //     itemBuilder: (context, i) {
          //       // 到达下一轮尾部，不一定是结束
          //       if (_words[i] == loadingTag) {
          //         if (_words.length > 50) {
          //           return Text('没有数据了');
          //         } else {
          //           // 显示logading，并加载数据
          //           loadData();
          //           return Container(
          //             padding: EdgeInsets.all(16),
          //             alignment: Alignment.center,
          //             child: SizedBox(
          //               width: 30,
          //               height: 30,
          //               child: CircularProgressIndicator(),
          //             ),
          //           );
          //         }
          //       }
          //       return Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 16),
          //         child: Text('${_words[i]}----${i}'),
          //       );
          //     },
          //     separatorBuilder: (context, i) {
          //       return Divider(color: Colors.black);
          //     },
          //     itemCount: _words.length,
          //   ),
          // ),
        ],
      ),
    );
  }

  void loadData() {
    // 每次加载5条数据
    var dataGroup1 = ['aaa', 'bbb', 'ccc', 'ddd', 'eeee1111'];
    var dataGroup2 = ['111', '2222', '3333', '5555', '655555'];
    // 延时两秒，add
    Future.delayed(Duration(seconds: 2)).then(
      (e) => {
        setState(() {
          _words.insertAll(_words.length - 1, flag ? dataGroup1 : dataGroup2);
          flag = !flag;
        }),
      },
    );
  }
}
