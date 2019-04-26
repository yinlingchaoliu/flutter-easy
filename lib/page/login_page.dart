import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/common/bloc/base_bloc.dart';
import 'package:flutter_easy/common/util/util_index.dart';
import 'package:flutter_easy/res/res_index.dart';

///@author: chentong
///2019-4-9
///视图层
class LoginPage extends StatefulWidget {
  ///路由跳转
  static void pushLoginPage(BuildContext context) {
    Navigator.push(
        context,
        new CupertinoPageRoute<void>(
            builder: (ctx) => new BlocProvider<LoginBloc>(
                  child: new LoginPage(),
                  bloc: new LoginBloc(),
                )));
  }

  ///获得当前页面实例
  static StatefulWidget newInstance() {
    return new BlocProvider<LoginBloc>(
      child: new LoginPage(),
      bloc: new LoginBloc(),
    );
  }

  @override
  _LoginPageState createState() => new _LoginPageState();
}

///
/// 页面实现
///
class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LoginBloc bloc = BlocProvider.of<LoginBloc>(context);

    return new Scaffold(
        backgroundColor: Colors.white,

        ///todo SingleChildScrollView 包一层，解决输入法弹出，空间溢出错误
        body: new SingleChildScrollView(
            child: new Container(
          margin: CommonUtil.padding(left: 30, right: 30),
          child: new Column(
            children: <Widget>[
              new Container(
                height: 65,
                child: new Row(
                  children: <Widget>[
                    new WidgetDecoration(Image.asset(
                      AppIcons.ICON_PHONE,
                      height: 18,
                    )).align().build(),
                    new WidgetDecoration(new TextFormField(
                      decoration: InputDecoration(
                        hintText: "请输入手机号",
                        contentPadding: CommonUtil.padding(left: 10),
                        border: InputBorder.none,
                      ),
                      style: new TextStyle(fontSize: 16, color: Colors.black),
                      keyboardType: TextInputType.phone,
                    )).align().expanded().build()
                  ],
                ),
              ),
              CommonWidget.getDivider(), //分割线
              new Container(
                height: 65,
                child: new Row(
                  children: <Widget>[
                    new WidgetDecoration(Image.asset(
                      AppIcons.ICON_IDCODE,
                      height: 18,
                    )).align().build(),
                    new WidgetDecoration(new TextFormField(
                      decoration: InputDecoration(
                        hintText: "请输入登录密码",
                        contentPadding: CommonUtil.padding(left: 10),
                        border: InputBorder.none,
                      ),
                      style: new TextStyle(fontSize: 16, color: Colors.black),
                      keyboardType: TextInputType.text,
                    )).align().expanded().build()
                  ],
                ),
              ),
              CommonWidget.getDivider(), //分割线
              new WidgetDecoration(CommonWidget.getLoginRaisedButton(text: '登录', onPressed: () {}))
                  .padding(top: 60, left: 50, right: 50)
                  .build(),
            ],
          ),
        )));
  }

  test() {}

  @override
  void dispose() {
    super.dispose();
  }
}

///
///逻辑层
///todo:此处逻辑建议迁移出去 分离开解耦
///
class LoginBloc extends BlocBase {
  @override
  void initState() {}

  @override
  void dispose() {}
}
