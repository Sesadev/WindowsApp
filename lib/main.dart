import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WebViewScreen(),
    );
  }
}

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final webviewController = WebviewController();

  @override
  void initState() {
    super.initState();
    _initWebView();
  }

  Future<void> _initWebView() async {
    await webviewController.initialize();
    await webviewController.loadUrl('https://web.whatsapp.com/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('WhatsApp Web'),
      // ),
      body: Webview(
        webviewController,
        permissionRequested: (String url, WebviewPermissionKind permissionKind, bool isUserInitiated) async {
          return WebviewPermissionDecision.allow;
        },
      ),
    );
  }

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }
}
