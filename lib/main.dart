import 'package:flutter/material.dart';
import 'package:fluttertest1/pluginUse.dart';
import 'package:fluttertest1/res_page.dart';

import 'gesture.dart';
import 'layout_page.dart';
import 'less_group_page.dart';
import 'statefull_group_page.dart';
import 'widget_lifecycle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          //布局容器
          appBar: AppBar(
            title: Text('如何创建和使用Flutter的路由与导航？'),
          ),
          body: RouteNavigator(),
        ),
        routes: <String, WidgetBuilder>{
          'plugin': (BuildContext context) => PluginUse(),
          'less': (BuildContext context) => LessGroupPage(),
          'ful': (BuildContext context) => StateFullGroup(),
          'layout': (BuildContext context) => LayoutPage(),
          'gesture': (BuildContext context) => GesturePage(),
          'res': (BuildContext context) => ResPage(),
          'lifecycle': (BuildContext context) => WidgetLifecycle(),
        });
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
              title: Text('${byName ? '' : '不'}通过路由名跳转'),
              value: byName,
              onChanged: (value) {
                setState(() {
                  byName = value;
                });
              }),
          _item('StatelessWidget与基础组价', LessGroupPage(), 'less'),
          _item('StatefulWidget与基础组价', StateFullGroup(), 'ful'),
          _item('如何进行Flutter布局开发', LayoutPage(), 'layout'),
          _item('如何使用Flutter包和插件', PluginUse(), 'plugin'),
          _item('如何检测用户手势及处理点击事件', GesturePage(), 'gesture'),
          _item('如何导入和使用Flutter的资源文件', ResPage(), 'res'),
          _item('Flutter页面生命周期', WidgetLifecycle(), 'lifecycle'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
