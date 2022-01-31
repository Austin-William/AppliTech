import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String url = "https://www.google.com";

class MicrosoftWebview extends StatefulWidget {
  const MicrosoftWebview({Key? key}) : super(key: key);

  @override
  _MicrosoftWebviewState createState() => _MicrosoftWebviewState();
}

class _MicrosoftWebviewState extends State<MicrosoftWebview> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: const Center(
        child: Text('Loading...'),
      ),
    );
  }
}
