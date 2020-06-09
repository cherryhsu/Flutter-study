import 'package:flutter/material.dart';

///Flutter应用维度声明周期
///WidgetsBindingObserver：是一个Widgets绑定观察器，通过它我们可以监听应用的生命周期、语言等的变化
class AppLifecycle extends StatefulWidget {
  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this); //添加到监听器
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter应用生命周期'),
        leading: BackButton(),
      ),
      body: Container(
        child: Text('Flutter应用生命周期'),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('state = $state');
    if (state == AppLifecycleState.paused) {
      //paused应用挂起，比如退到后台，失去了焦点且不会收到
      print('app进入后台');
    } else if (state == AppLifecycleState.resumed) {
      print('app进入前台');
    }else if(state == AppLifecycleState.inactive){
      //不常用：应用程序处于非活动状态，并且未接收用户输入时调用，比如：来了个电话

    }else if(state == AppLifecycleState.detached){
      //页面销毁
    }
  }

 @override
  void dispose() {
   WidgetsBinding.instance.removeObserver(this);
   super.dispose();
  }
}
