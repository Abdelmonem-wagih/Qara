import 'package:bloc/bloc.dart';
import 'package:qara/Feature/ToDO/cubit/muilt_state/to_do_muilti_state.dart';

part 'to_do_multi_cubit.freezed.dart';

class ToDoMultiCubit extends Cubit<ToDoMultiState> {
  ToDoMultiCubit() : super(ToDoMultiState.initial());

  void addItem(String title, String description) {
    if (state is _Loaded) {
      final currentState = state as _Loaded;
      if (currentState.items.length < 10) {
        final updatedItems = List<Map<String, String>>.from(currentState.items)
          ..add({'title': title, 'description': description});
        emit(ToDoMultiState.loaded(updatedItems));
      } else {
        emit(ToDoMultiState.limitReached());
      }
    }
  }

  void deleteItem(int index) {
    if (state is _Loaded) {
      final currentState = state as _Loaded;
      final updatedItems = List<Map<String, String>>.from(currentState.items)
        ..removeAt(index);
      emit(ToDoMultiState.loaded(updatedItems));
    }
  }

  void loadItems(List<Map<String, String>> items) {
    emit(ToDoMultiState.loaded(items));
  }
}
