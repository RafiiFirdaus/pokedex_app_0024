import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String type;
  final int number;

  const DetailPage({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.type,
    required this.number,
  });

  Color _getTypeColor(String type) {
    switch (type) {
      case 'Fire':
        return const Color(0xFFefd3ba);
      case 'Water':
        return const Color(0xFFbedbdd);
      case 'Grass':
        return const Color(0xFFc3e3d4);
      default:
        return Colors.grey[300]!;
    }
  }

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Color typeColor = widget._getTypeColor(widget.type);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.number.toString().padLeft(3, '0'),
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF20214c),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // pokemon image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: typeColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.network(
                      widget.imageUrl,
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
