import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'multi_state_state.dart';
part 'multi_state_cubit.freezed.dart';

class MultiStateCubit extends Cubit<MultiStateState> {
  MultiStateCubit() : super(MultiStateState.initial());

  void addItem(String title, String description) {
    if (state is _Loaded) {
      final currentState = state as _Loaded;
      if (currentState.items.length < 10) {
        final updatedItems = List<Map<String, String>>.from(currentState.items)
          ..add({'title': title, 'description': description});
        emit(MultiStateState.loaded(updatedItems));
      } else {
        emit(MultiStateState.limitReached());
      }
    }
  }

  void deleteItem(int index) {
    if (state is _Loaded) {
      final currentState = state as _Loaded;
      final updatedItems = List<Map<String, String>>.from(currentState.items)
        ..removeAt(index);
      emit(MultiStateState.loaded(updatedItems));
    }
  }

  void loadItems(List<Map<String, String>> items) {
    emit(MultiStateState.loaded(items));
  }
}
