import 'package:flutter/material.dart';
import 'package:pokedex_app/detail_page.dart';
import 'package:pokedex_app/model/dummy_data.dart';
import 'package:pokedex_app/shared/widget/pokemon_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              SizedBox(height: 20),
              searchBar(searchController),
              SizedBox(height: 20),
              listPokemon(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget header() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Pokedex',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
      Text(
        'Search for a pokemon by name or using its National Pokedex number',
        style: TextStyle(fontSize: 20, color: Color(0xFF20214c)),
      ),
    ],
  );
}

Widget searchBar(TextEditingController searchController) {
  return Row(
    spacing: 5,
    children: [
      Expanded(
        child: TextFormField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: "Search a pokemon",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xFF5d607d),
        ),
        child: Icon(Icons.filter_list, color: Colors.white),
      ),
    ],
  );
}

Widget listPokemon() {
  return Expanded(
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: dummyPokemonList.length,
      itemBuilder: (context, index) {
        return PokemonCardWidget(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  name: dummyPokemonList[index].name,
                  imageUrl: dummyPokemonList[index].imageUrl,
                  type: dummyPokemonList[index].type,
                  number: dummyPokemonList[index].number,
                ),
              ),
            );
          },
          imageUrl: dummyPokemonList[index].imageUrl,
          name: dummyPokemonList[index].name,
          type: dummyPokemonList[index].type,
        );
      },
    ),
  );
}
