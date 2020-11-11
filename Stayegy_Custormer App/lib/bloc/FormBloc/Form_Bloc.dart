import 'package:bloc/bloc.dart';
import 'package:stayegy/bloc/FormBloc/Form_Events.dart';
import 'package:stayegy/bloc/FormBloc/Form_States.dart';

class FormBloc extends Bloc<FormEvents, FormStates> {
  FormBloc() : super(phoneNumberNotCheckedState());

  @override
  Stream<FormStates> mapEventToState(FormEvents event) async* {
    if (event is phoneNumberCheckEvent) {
      yield (event.phoneNumber.length > 9)
          ? phoneNumberCheckedState()
          : phoneNumberNotCheckedState();
    }
  }

  @override
  void onEvent(FormEvents event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(stackTrace);
  }

  @override
  Future<void> close() {
    print('Bloc Closed');
    return super.close();
  }
}
