import 'package:applitech/api/api.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:applitech/global/variables.dart' as global;

class WebviewPage extends StatelessWidget {
  final BuildContext context;
  const WebviewPage({
    Key? key,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebViewController _controller;
    return Scaffold(
      body: WebView(
        initialUrl: global.redirectUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
        javascriptChannels: <JavascriptChannel>{
          _extractDataJSChannel(context),
        },
        onPageStarted: (url) {
          print('Page started loading: $url');
        },
        onPageFinished: (url) {
          print('Page finished loading: $url');
        },
      ),
    );
  }

  JavascriptChannel _extractDataJSChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Flutter',
      onMessageReceived: (JavascriptMessage message) {
        String pageBody = message.message;
        print('page body: $pageBody');
      },
    );
  }
}
