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

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
