import 'package:flutter/material.dart';
import 'package:untitled1/pokemon_screen.dart';

class PokemonItem extends StatelessWidget {
  final PokemonModel model;
  const PokemonItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 204,
      width: 212,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(model.number, style: TextStyle(color: model.color),),
          Expanded(
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Image.network(model.image, height: 200),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: model.color,
            ),
            child: Text(
              model.name,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(color: model.color, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
