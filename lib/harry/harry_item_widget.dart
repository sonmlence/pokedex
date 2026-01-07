import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/harry/cubit/harry_cubit.dart';

import 'model/harry_model.dart';

class HarryItemWidget extends StatelessWidget {
  final HarryModel item;
  const HarryItemWidget({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
context.read<HarryCubit>().getCharacters();
print('click item');
      } ,
      child: Column(
        children: [
          Text(item.fullName, style: TextStyle(fontSize: 40)),
CachedNetworkImage(imageUrl: item.image)
        ],
      ),
    );
  }
}
