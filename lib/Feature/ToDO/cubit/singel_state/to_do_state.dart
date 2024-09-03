import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_do_state.freezed.dart';

@freezed
class ToDoState with _$ToDoState {
  const factory ToDoState({
    required List<Map<String, String>> items,
  }) = _ToDoState;

  factory ToDoState.initial() => const ToDoState(items: []);
}
