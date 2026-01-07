import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/dattebayo/cubit/dattebayo_cubit.dart';
import 'package:untitled1/dattebayo/dattebayo_item_widget.dart';


class DattebayoScreen extends StatefulWidget {
  const DattebayoScreen({super.key});

  @override
  State<DattebayoScreen> createState() => _DattebayoScreenState();
}

class _DattebayoScreenState extends State<DattebayoScreen> {
  final cubit = DattebayoCubit()..getCharacters();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => cubit,
        child: Scaffold(
          body: BlocBuilder<DattebayoCubit, DattebayoState>(
            bloc: cubit,
            builder: (context, state) {
              if (state is DattebayoSuccess) {
                final list = state.listModels;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return DattebayoItemWidget(item: item);
                  },
                );
              } else if (state is DattebayoError) {
                return Center(
                  child: Text(
                    state.message,
                    style: TextStyle(fontSize: 50),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
