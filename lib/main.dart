import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hiffy',
      home: HiffyWebView(),
    );
  }
}

class HiffyWebView extends StatefulWidget {
  const HiffyWebView({super.key});

  @override
  State<HiffyWebView> createState() => _HiffyWebViewState();
}

class _HiffyWebViewState extends State<HiffyWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
     FlutterNativeSplash.remove();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://hiffywebapp.web.app/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      body: SafeArea(child: WebViewWidget(controller: _controller)),
    );
  }
}
