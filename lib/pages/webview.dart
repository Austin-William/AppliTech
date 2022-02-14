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
    return Scaffold(
      body: WebView(
        initialUrl: global.redirectUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onPageStarted: (String url) {
          getAccessToken(context, url);
        },
      ),
    );
  }
}
