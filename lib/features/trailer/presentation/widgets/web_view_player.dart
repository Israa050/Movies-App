import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPlayerWidget extends StatefulWidget {
  const WebViewPlayerWidget({super.key});

  @override
  State<WebViewPlayerWidget> createState() => _WebViewPlayerWidgetState();
}

class _WebViewPlayerWidgetState extends State<WebViewPlayerWidget> {

  bool _isloading = true;


NavigationDelegate navigationDelegate() {
    return NavigationDelegate(
      onNavigationRequest: (request) {
        return NavigationDecision.navigate;
      },
      onProgress: (progress) {
        setState(() {
          _isloading = true;
        });
      },
      onPageFinished: (url) {
        setState(() {
          _isloading = false;
        });
      },
    );
  }

   WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://flutter.dev'),)
    ..setNavigationDelegate(NavigationDelegate());


    @override
  void initState() {
    super.initState();
    _controller =  WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://flutter.dev'),)
    ..setNavigationDelegate(navigationDelegate());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trailers Page',
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
             WebViewWidget(
            controller: _controller,
          ),

           if (_isloading)
            const Center(
              child: CircularProgressIndicator(
                color: Color(0xff8A0506),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
