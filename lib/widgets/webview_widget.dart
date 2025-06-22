// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewWidget extends StatefulWidget {
  final String url;
  const WebviewWidget({super.key, required this.url});

  @override
  State<WebviewWidget> createState() => _WebviewWidgetState();
}

class _WebviewWidgetState extends State<WebviewWidget> {
  late final WebViewController _controller;

  void initState() {
    super.initState();
    _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd8f2f7),
        toolbarHeight: 90,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 100),
            child: Row(
              children: [
                Image.asset("assets/logo.png", height: 50, width: 180),
              ],
            ),
          ),
        ],
      ),
      body:WebViewWidget(controller:_controller),
    );
  }
}
