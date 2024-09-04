import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_do_multi_state.freezed.dart'; // Ensure this matches the generated file name

@freezed
class ToDoMultiState with _$ToDoMultiState {
  const factory ToDoMultiState.initial() = _Initial;
  const factory ToDoMultiState.loading() = _Loading;
  const factory ToDoMultiState.loaded(List<Map<String, String>> items) =
      _Loaded;
  const factory ToDoMultiState.limitReached() = _LimitReached;
}
