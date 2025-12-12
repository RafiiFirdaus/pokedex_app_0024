import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String type;

  const DetailPage({
    super.key, 
    required this.name, 
    required this.imageUrl, 
    required this.type
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
