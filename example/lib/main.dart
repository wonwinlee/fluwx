import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wechat_plugin/src/wechat_share_models.dart';
import 'package:wechat_plugin/wechat_plugin.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => new _MyAppState();

}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
//wxd930ea5d5a258f4f
  @override
  void initState() {
    super.initState();
    WechatPlugin.init("wxd930ea5d5a258f4f");
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
//      platformVersion = await WechatPlugin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: new Center(
          child: GestureDetector(
               onTap:(){
                    var wx = WechatPlugin();
                    wx.shareText(WeChatShareTextModel(text: "wq kcg r",
                        transaction: "xxxx${DateTime.now().millisecondsSinceEpoch}",
                    ));
               } ,
              child: new Text('Running on: $_platformVersion\n')),
        ),
      ),
    );
  }
}
