import 'package:flutter/material.dart';

///无状态的Widget StateLessWidget只有createElement与build两个生命周期
///StatefulWidget的生命周期按照时期的不同可以分为三组
///1,初始化时期
///createState、initState
///2.更新期间
///didChangeDependencies、build、didUpdateWidget
///3.销毁期
///deactivate、dispose

class WidgetLifecycle extends StatefulWidget {
  ///当我们构建一个新的StatefulWidget时，这个会立即调用createState()
  ///并且这个方法必须被覆盖
  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  int _count = 0;

  ///这是创建Widget时调用的除构造方法外的第一个方法
  ///在这个方法中通常会做一些初始化工作，比如channel的初始化，监听器的初始化等
  @override
  void initState() {
    // TODO: implement initState
    print('----initState-----');
    super.initState();
  }

  ///当依赖的State对象改变时会调用
  ///a.在第一次构建Widget时，在initState()之后立即调用此方法
  ///b.如果StatefulWidget依赖于InheritedWidget,那么当当前State所依赖的InheritedWidget中的变量改变时会再次调用它
  ///InheritedWidget可以高效的将数据在Widget树种乡下传递、共享
  @override
  void didChangeDependencies() {
    print('----didChangeDependencies-----');
    super.didChangeDependencies();
  }

  ///这是一个必须实现的方法，在这里实现你要呈现的页面内容
  ///它会在didChangeDependencies()之后立即调用
  ///另外当调用setState后也会再次调用改方法
  Widget build(BuildContext context) {
    print('----build-----');
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter页面生命周期'),
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
              child: Text(
                '点我',
                style: TextStyle(fontSize: 26),
              ),
            ),
            Text(_count.toString())
          ],
        ),
      ),
    );
  }

  //alt+insert健
  ///这是一个不常用的生命周期方法，当父组件需要重新绘制时才会调用
  ///该方法会携带一个oldWidget参数，可以将其与当期的widget进行对比以便执行一些额外的逻辑
  ///if(oldWidget.xxx!=widget.xxx)...
  @override
  void didUpdateWidget(WidgetLifecycle oldWidget) {
    print('----didUpdateWidget-----');
    super.didUpdateWidget(oldWidget);
  }

  ///很少使用，在组件别移除时调用 在dispose之前调用
  ///
  @override
  void deactivate() {
    print('----deactivate-----');
    super.deactivate();
  }

  ///常用，组件被销毁时调用：
  ///通常在该方噶中执行一些资源的释放工作比如：监听器的卸载，channel的销毁等
  @override
  void dispose() {
    print('----dispose-----');
    // TODO: implement dispose
    super.dispose();
  }
}
