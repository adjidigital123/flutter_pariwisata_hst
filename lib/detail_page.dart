import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String deskripsi = "";
  Map<String, String>? data;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      data = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      _loadDeskripsi(data!['file']!);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(data!['nama']!)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // FOTO 1
            Image.asset(
              data!['gambar']!,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),

            // FOTO 2 (opsional)
            if (data!.containsKey('gambar2'))
              Image.asset(
                data!['gambar2']!,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

            const SizedBox(height: 20),

            // TEKS DESKRIPSI RAPI
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                deskripsi,
                textAlign: TextAlign.justify,     // 🟢 TEKS RATA KANAN KIRI
                style: const TextStyle(
                  fontSize: 12,
                  height: 1.5,                    // 🟢 Jarak antar baris
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _loadDeskripsi(String path) async {
    String text = await rootBundle.loadString(path);
    setState(() => deskripsi = text);
  }
}