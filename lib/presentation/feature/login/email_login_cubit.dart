import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:owwn_coding_challenge/data/services/response_errors.dart';
import 'package:owwn_coding_challenge/domain/entities/requests/email_request_model.dart';
import 'package:owwn_coding_challenge/domain/usecases/login/email_login_use_case.dart';
import 'package:owwn_coding_challenge/domain/validation/email.dart';
import 'package:owwn_coding_challenge/presentation/common/bloc/base_status.dart';

part 'email_login_cubit.freezed.dart';
part 'email_login_state.dart';

@Injectable()
class EmailLoginCubit extends Cubit<EmailLoginState> {
  EmailLoginCubit(this._emailPasswordLoginUseCase)
      : super(EmailLoginState.initial());

  final EmailLoginUseCase _emailPasswordLoginUseCase;

  void emailChanged(String value) {
    if (value.trim() != state.email.value) {
      final Email newVal = Email.dirty(value: value.trim());
      emit(
        state.copyWith(
          email: newVal,
          status: validateFormStep1(email: newVal),
        ),
      );
    }
  }

  BaseStatus validateFormStep1({
    required Email email,
  }) {
    final formStatus = Formz.validate([email]);
    return formStatus.isValidated
        ? const BaseStatus.valid()
        : const BaseStatus.inValid();
  }

  Future<void> onLogin() async {
    if (state.status.isLoading) return;

    emit(
      state.copyWith(
        status: const BaseStatus.loading(),
      ),
    );
    try {
      await _emailPasswordLoginUseCase.run(
        EmailRequestModel.createModel(
          email: state.email.value,
        ),
      );
      emit(
        state.copyWith(
          status: const BaseStatus.success(),
        ),
      );
    } catch (e, stack) {
      emit(
        state.copyWith(
          status: BaseStatus.failure(ResponseErrors.fromDioError(e)),
        ),
      );
    }
  }
}
