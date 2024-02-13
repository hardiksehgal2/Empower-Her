import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:webview_flutter/webview_flutter.dart';

class SafeWebView extends StatelessWidget {
  final String? url;

  SafeWebView({this.url});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // Use a different approach or show a message for web
      return Center(
        child: Text("WebView is not supported on web"),
      );
    }

    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      // Use webview_flutter for Android and iOS
      return SafeArea(
        child: WebViewWidget(url: url!),
      );
    } else {
      // Use a different approach or show a message for unsupported platforms
      return Center(
        child: Text("WebView is not supported on this platform"),
      );
    }
  }
}

class WebViewWidget extends StatefulWidget {
  final String url;

  WebViewWidget({required this.url});

  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
      onWebViewCreated: (WebViewController controller) {
        _controller = controller;
        _controller.evaluateJavascript("document.addEventListener('DOMContentLoaded', "
            "function() { "
            "document.getElementsByTagName('body')[0].style.backgroundColor = 'white'; "
            "});");
      },
    );
  }
}
