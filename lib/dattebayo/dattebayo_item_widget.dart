import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/dattebayo/cubit/dattebayo_cubit.dart';

import 'model/dattebayo_model.dart';

class DattebayoItemWidget extends StatelessWidget {
  final DattebayoModel item;
  const DattebayoItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<DattebayoCubit>().getCharacters();
        print('click item');
      },
      child: Column(
        children: [
          Text(item.name, style: TextStyle(fontSize: 40)),
          Image.network(item.image),
        ],
      ),
    );
  }
}
