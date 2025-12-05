import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled1/pokemon/pokemon_item.dart';

import 'detail_pokemon_card_widget.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final bulbaUrl =
      'https://sg.portal-pokemon.com/play/resources/pokedex/img/pm/cf47f9fac4ed3037ff2a8ea83204e32aff8fb5f3.png';
  final charmaUrl =
      'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/004.png';
  final pikachuUrl =
      'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/025.png';
  List<PokemonModel> list = [];

  @override
  void initState() {
    super.initState();
    list = [
      PokemonModel(
        name: 'Bulbasaur',
        image: bulbaUrl,
        color: Colors.green,
        number: '#001',
        pokemon_type: 'Grass',
        pokemon_second_type: 'Poison',
        weight: '6.9 kg',
        height: '0.7 m',
        moves: 'Chlorophyll Overgrow',
        description:
            'There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.',
      ),
      PokemonModel(
        name: 'Charmander',
        image: charmaUrl,
        color: Colors.orange,
        number: '#002',
        pokemon_type: 'Fire',
        weight: '8.5 kg',
        height: '0.6 m',
        moves: 'Mega-Punch Fire-punch',
        description:
            'It has a preference for hot things. When it rains, steam is said to spout from the tip of its tail.',
      ),
      PokemonModel(
        name: 'Pikachu',
        image: pikachuUrl,
        color: Colors.amber,
        number: '#003',
        pokemon_type: 'Electric',
        weight: '6.0 kg',
        height: '0.4 m',
        moves: 'Mega-Punch Pay-Day',
        description:
        'Pikachu that can generate powerful electricity have cheek sacs that are extra soft and super stretchy.',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.network(
                'https://static.thenounproject.com/png/594337-200.png',
                width: 24,
                height: 32,
              ),
              SizedBox(width: 15),
              Text(
                'Pokédex',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 200),
              Text('#', style: TextStyle(fontSize: 16)),
              SvgPicture.asset('assets/icons/arrow.svg'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        final item = list[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailPokemonCardWidget(model: item),
                          ),
                        );
                      },
                      child: PokemonItem(model: list[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PokemonModel {
  final String name;
  final String number;
  final String image;
  final Color color;
  final String pokemon_type;
  final String? pokemon_second_type;
  final String weight;
  final String height;
  final String moves;
  final String description;

  PokemonModel({
    required this.name,
    required this.image,
    required this.color,
    required this.number,
    required this.pokemon_type,
    this.pokemon_second_type,
    required this.weight,
    required this.height,
    required this.moves,
    required this.description,
  });
}
