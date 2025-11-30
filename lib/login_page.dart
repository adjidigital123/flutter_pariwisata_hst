import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  String errorMsg = "";

  void _login() {
    if (userC.text == "admin" && passC.text == "admin") {
      Navigator.pushNamed(context, '/list');
    } else {
      setState(() {
        errorMsg = "Username atau Password salah!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                /// ===========================
                ///   LOGO KIRI & KANAN (ROW)
                /// ===========================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/logohst.png",
                      width: 110,
                    ),
                    Image.asset(
                      "assets/images/disporaparhst.png",
                      width: 170,
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                const Text(
                  "APLIKASI PARIWISATA BARABAI",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                /// Username
                TextField(
                  controller: userC,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(),
                  ),
                ),
                
                const SizedBox(height: 20),

                /// Password
                TextField(
                  controller: passC,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                if (errorMsg.isNotEmpty)
                  Text(
                    errorMsg,
                    style: const TextStyle(color: Colors.red),
                  ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: const Text("MASUK"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}