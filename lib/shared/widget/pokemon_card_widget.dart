import 'package:flutter/material.dart';

class PokemonCardWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String type;
  final VoidCallback onTap;

  const PokemonCardWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle card tap if needed
      },
      child: Container(
        decoration: BoxDecoration(
          // ganti warna sesuai dengan type
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageUrl, height: 100, width: 100),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(type, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}
