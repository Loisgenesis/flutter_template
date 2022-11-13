import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owwn_coding_challenge/data/services/response_errors.dart';

part 'base_status.freezed.dart';

@freezed
class BaseStatus<T> with _$BaseStatus<T> {
  const factory BaseStatus.initial() = Initial<T>;

  const factory BaseStatus.valid() = Valid<T>;

  const factory BaseStatus.inValid() = InValid<T>;

  const factory BaseStatus.loading() = Loading<T>;

  const factory BaseStatus.submitted() = Submitted<T>;

  const factory BaseStatus.success() = Success<T>;

  const factory BaseStatus.failure(ResponseErrors error) = Failure<T>;

  const factory BaseStatus.exceptionFailure(Exception exception) =
      ExceptionFailure<T>;

  const factory BaseStatus.action(T action) = Action<T>;

  ///Used to show an empty state for a page
  const factory BaseStatus.empty() = Empty<T>;
}

extension BaseStatusExtension<T> on BaseStatus<T> {
  bool get isInitial => this is Initial<T>;

  bool get isValid => this is Valid<T>;

  bool get isInValid => this is InValid<T>;

  bool get isLoading => this is Loading<T>;

  bool get isSubmitted => this is Submitted<T>;

  bool get isSuccess => this is Success<T>;

  bool get isFailure => this is Failure<T>;

  bool get isExceptionFailure => this is ExceptionFailure<T>;

  bool get isAction => this is Action<T>;

  bool get isEmpty => this is Empty<T>;
}
