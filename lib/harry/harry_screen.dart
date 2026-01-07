import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:untitled1/data/pref_helper.dart';
import 'package:untitled1/harry/cubit/harry_cubit.dart';
import 'package:untitled1/harry/harry_item_widget.dart';

import 'model/harry_model.dart';

class HarryScreen extends StatefulWidget {
  const HarryScreen({super.key});
  @override
  State<HarryScreen> createState() => _HarryScreenState();
}

class _HarryScreenState extends State<HarryScreen> {
  final cubit = HarryCubit()
    ..getCharacters();

  @override
  void initState() {
    super.initState();
    Future.sync(() async{
      final list = await PrefHelper().getList();
      print(list);
    }
    );
    PrefHelper().getList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: Scaffold(
        body: BlocBuilder<HarryCubit, HarryState>(
          builder: (context, state) {
            if (state is Success) {
              return ListView.builder(
                itemCount: state.listModels.length,
                itemBuilder: (context, index) {
                  return HarryItemWidget(
                    item: state.listModels[index],
                  );
                },
              );
            } else if (state is Error) {
              return Center(child: Text(state.message));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}