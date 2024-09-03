import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:qara/Feature/ToDO/cubit/singel_state/to_do_state.dart';


class ToDoCubit extends Cubit<ToDoState> {
  final BuildContext context;

  ToDoCubit(this.context) : super(ToDoState.initial());

  void addItem(String title, String description) {
    if (state.items.length < 10) {
      final updatedItems = List<Map<String, String>>.from(state.items)
        ..add({'title': title, 'description': description});
      emit(state.copyWith(items: updatedItems));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please delete an item to add a new one.'),
        ),
      );
    }
  }

  void deleteItem(int index) {
    final updatedItems = List<Map<String, String>>.from(state.items)
      ..removeAt(index);
    emit(state.copyWith(items: updatedItems));
  }
}
