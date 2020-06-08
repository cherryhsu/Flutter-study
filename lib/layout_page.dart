import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

///如何进行Flutter布局开发
class LayoutPage extends StatefulWidget {
  @override
  _LayoutPage createState() => _LayoutPage();
}

class _LayoutPage extends State<LayoutPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: '如何进行Flutter布局开发',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('如何进行Flutter布局开发'),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.grey,
                    ),
                    activeIcon: Icon(Icons.home, color: Colors.blue),
                    title: Text('首页')),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.list,
                      color: Colors.grey,
                    ),
                    activeIcon: Icon(Icons.list, color: Colors.blue),
                    title: Text('列表'))
              ]),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Text('点我'),
          ),
          body: _currentIndex == 0
              ? RefreshIndicator(
                  child: ListView(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(color: Colors.white),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  ClipOval(
                                    child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Image.network(
                                        'http://www.devio.org/img/avatar.png',
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: ClipRRect(
                                      //圆角
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Opacity(
                                        opacity: 0.6,
                                        child: Image.network(
                                          'http://www.devio.org/img/avatar.png',
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              TextField(
                                //输入文本的样式
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    hintText: '请输入：',
                                    hintStyle: TextStyle(fontSize: 15)),
                              ),
                              Container(
                                height: 100,
                                margin: EdgeInsets.all(10),
                                child: PhysicalModel(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(6),
                                  clipBehavior: Clip.antiAlias, //抗锯齿
                                  child: PageView(
                                    children: <Widget>[
                                      _item('Page1', Colors.deepPurple),
                                      _item('Page2', Colors.green),
                                      _item('Page3', Colors.red),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  FractionallySizedBox(
                                    widthFactor: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.greenAccent),
                                      child: Text('宽度撑满'),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                      Stack(
                        //重叠
                        children: <Widget>[
                          Image.network(
                            'http://www.devio.org/img/avatar.png',
                            width: 100,
                            height: 100,
                          ),
                          Positioned(
                              left: 0,
                              bottom: 0,
                              child: Image.network(
                                'http://www.devio.org/img/avatar.png',
                                width: 36,
                                height: 36,
                              ))
                        ],
                      ),
                      Wrap(
                        //创建一个wrap布局，从左向右排列，会自动换行
                        spacing: 8, //水平边距
                        runSpacing: 10, //垂直间距
                        children: <Widget>[
                          _chip('Flutter'),
                          _chip('进阶'),
                          _chip('实战'),
                          _chip('携程'),
                          _chip('App')
                        ],
                      )
                    ],
                  ),
                  onRefresh: _handleRefresh)
              : Column(
                  children: <Widget>[
                    Text('列表'),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Text('拉伸填满高度'),
                    ))
                  ],
                )),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(microseconds: 200));
    return null;
  }

  _item(title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }
}

_chip(String label) {
  return Chip(
    label: Text(label),
    avatar: CircleAvatar(
      backgroundColor: Colors.blue.shade900,
      child: Text(
        label.substring(0, 1),
        style: TextStyle(fontSize: 10),
      ),
    ),
  );
}
