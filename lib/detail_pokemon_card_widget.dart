import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled1/pokemon_screen.dart';

class DetailPokemonCardWidget extends StatelessWidget {
  final PokemonModel model;

  const DetailPokemonCardWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: model.color,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 18,
              left: 10,
              child: SvgPicture.asset('assets/icons/arrow_left.svg'),
            ),
            Positioned(
              top: 10,
              left: 60,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    model.number,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              left: 180,
              child: SvgPicture.asset('assets/icons/pokeball.svg'),
            ),
            Positioned(
              bottom: 0,
              left: 10,
              right: 10,
              child: Container(
                height: size.height * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                Center(child: Image.network(model.image, height: 250)),
              ],
            ),
            Positioned(
              top: 300,
              left: 120,
              child: Row(
                children: [
                  Container(
                    width: 80,
                    padding: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: model.color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      model.pokemon_type,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(width: 12),
                  if (model.pokemon_second_type != null)
                    Container(
                      width: 80,
                      padding: EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        model.pokemon_second_type!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Positioned(
              top: 350,
              left: 180,
              child: Text(
                'About',
                style: TextStyle(
                  color: model.color,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Positioned(
              top: 400,
              left: 50,
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/moves_icon.svg',
                            height: 24,
                          ),
                          SizedBox(width: 5),
                          Text(model.weight, style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Weight',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),

                  SizedBox(width: 40),

                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/moves_icon.svg',
                            height: 24,
                          ),
                          SizedBox(width: 5),
                          Text(model.height, style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Height',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),

                  SizedBox(width: 40),

                  Column(
                    children: [
                      Text(
                        model.moves.replaceFirst(' ', '\n'),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Moves',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 490,
              left: 40,
              right: 40,
              child: Text(
                model.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
            ),
            Positioned(
              top: 540,
              left: 150,
              child: Text(
                'Base Stats',
                style: TextStyle(
                  fontSize: 20,
                  color: model.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 580,
              left: 40,
              right: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatBar('HP', 39, 0.39, model.color),
                  _buildStatBar('ATK', 52, 0.52, model.color),
                  _buildStatBar('DEF', 43, 0.43, model.color),
                  _buildStatBar('SATK', 60, 0.60, model.color),
                  _buildStatBar('SDEF', 50, 0.50, model.color),
                  _buildStatBar('SPD', 65, 0.65, model.color),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBar(String name, int value, double percent, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
            ),
          ),
          SizedBox(width: 40, child: Text(value.toString().padLeft(3, '0'))),
          Expanded(
            child: LinearProgressIndicator(
              value: percent,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}
