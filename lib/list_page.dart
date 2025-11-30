import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  final List<Map<String, String>> wisata = const [
    {
      "nama": "Pagat Batu Benawa",
      "gambar": "assets/images/pagat.jpg",
      "file": "assets/deskripsi/pagat.txt"
    },
    {
      "nama": "Riam Bajandik",
      "gambar": "assets/images/bajandik.jpg",
      "file": "assets/deskripsi/bajandik.txt"
    },
    {
      "nama": "Gunung Halau-Halau",
      "gambar": "assets/images/halau.jpg",
      "file": "assets/deskripsi/halau.txt"
    },
    {
      "nama": "Air Terjun Tumaung",
      "gambar": "assets/images/tumaung.jpg",
      "file": "assets/deskripsi/tumaung.txt"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Obyek Wisata Terpopuler di HST")),

      body: Column(
        children: [
          const SizedBox(height: 10),

          /// LOGO KIRI & KANAN
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/logohst.png",
                  width: 60,
                ),
                Image.asset(
                  "assets/images/disporaparhst.png",
                  width: 100,
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// LIST WISATA
          Expanded(
            child: ListView.builder(
              itemCount: wisata.length,
              itemBuilder: (context, index) {
                final item = wisata[index];

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        item['gambar']!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 60,
                            height: 60,
                            color: Colors.grey.shade300,
                            child: const Icon(Icons.image_not_supported),
                          );
                        },
                      ),
                    ),
                    title: Text(
                      item['nama']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: item,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}