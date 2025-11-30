import 'package:flutter/material.dart';
import 'login_page.dart';
import 'list_page.dart';
import 'detail_page.dart';

void main() {
  runApp(const PariwisataHST());
}

class PariwisataHST extends StatelessWidget {
  const PariwisataHST({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Aplikasi Pariwisata HST",
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/list': (context) => const ListPage(),
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}
