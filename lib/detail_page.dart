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
              const SizedBox(height: 20),
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
              const SizedBox(height: 30),

              // menu
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildTabItem("Forms", isActive: true),
                      _buildTabItem("Detail"),
                      _buildTabItem("Types"),
                      _buildTabItem("Stats"),
                      _buildTabItem("Weakness"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // detail forms evolution
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Row(
                  children: [
                    _buildEvolutionBox(typeColor, isOpacity: true),
                    const SizedBox(width: 15),
                    _buildEvolutionBox(typeColor),
                    const SizedBox(width: 15),
                    _buildEvolutionBox(typeColor, isOpacity: true),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Mega Evolution",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF20214c),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "In order to support its flower, which has grown larger due to Mega Evolution, its back and legs have become stronger.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF20214c),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(String title, {bool isActive = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? Colors.black : Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEvolutionBox(Color color, {bool isOpacity = false}) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: isOpacity ? color.withOpacity(0.5) : color,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
      child: isOpacity
          ? const Icon(Icons.question_mark, size: 40, color: Colors.white)
          : Image.network(widget.imageUrl),
    );
  }
}
