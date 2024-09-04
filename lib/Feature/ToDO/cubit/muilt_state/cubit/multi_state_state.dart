part of 'multi_state_cubit.dart';

@freezed
class MultiStateState with _$MultiStateState {
  const factory MultiStateState.initial() = _Initial;
  const factory MultiStateState.loading() = _Loading;
  const factory MultiStateState.loaded(List<Map<String, String>> items) =
      _Loaded;
  const factory MultiStateState.error() = _Error;
  const factory MultiStateState.limitReached() = _LimitReached;
}
