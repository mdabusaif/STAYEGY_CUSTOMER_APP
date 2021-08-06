import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stayegy/bloc/FormBloc/Form_Events.dart';
import 'package:stayegy/bloc/FormBloc/Form_States.dart';

class FormBloc extends Bloc<FormEvents, FormStates> {
  FormBloc() : super(PhoneNumberNotCheckedState());

  @override
  Stream<FormStates> mapEventToState(FormEvents event) async* {
    if (event is PhoneNumberCheckEvent) {
      yield (event.phoneNumber.length == 11) ? PhoneNumberCheckedState() : PhoneNumberNotCheckedState();
    } else if (event is GetImageEvent) {
      yield* _mapGetImageEventToState(event);
    } else if (event is NameAndEmailValidationCheckEvent) {
      yield* _mapNameAndEmailValidationCheckEventToState(event);
    } else if (event is NameValidationCheckEvent) {
      yield* _mapNameValidationEventToState(event);
    } else if (event is EmailValidationCheckEvent) {
      yield* _mapEmailValidationEventToState(event);
    }
  }

  Stream<FormStates> _mapGetImageEventToState(FormEvents events) async* {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      yield ImagePickedState(pickedFile: pickedFile);
    } else {
      yield ImagePickedFailedState();
    }
  }

  Stream<FormStates> _mapNameAndEmailValidationCheckEventToState(NameAndEmailValidationCheckEvent event) async* {
    final RegExp emailRegex = RegExp(r'^[a-z0-9]+([-+._][a-z0-9]+){0,2}@.*?(\.(a(?:[cdefgilmnoqrstuwxz]|ero|(?:rp|si)a)|b(?:[abdefghijmnorstvwyz]iz)|c(?:[acdfghiklmnoruvxyz]|at|o(?:m|op))|d[ejkmoz]|e(?:[ceghrstu]|du)|f[ijkmor]|g(?:[abdefghilmnpqrstuwy]|ov)|h[kmnrtu]|i(?:[delmnoqrst]|n(?:fo|t))|j(?:[emop]|obs)|k[eghimnprwyz]|l[abcikrstuvy]|m(?:[acdeghklmnopqrstuvwxyz]|il|obi|useum)|n(?:[acefgilopruz]|ame|et)|o(?:m|rg)|p(?:[aefghklmnrstwy]|ro)|qa|r[eosuw]|s[abcdeghijklmnortuvyz]|t(?:[cdfghjklmnoprtvwz]|(?:rav)?el)|u[agkmsyz]|v[aceginu]|w[fs]|y[etu]|z[amw])\b){1,2}$');

    if (event.name.isEmpty) {
      yield NameFieldEmptyState();
    } else if (event.email.isEmpty) {
      yield EmailFieldEmptyState();
    } else if (!emailRegex.hasMatch(event.email)) {
      yield EmailFieldNotValidState();
    } else if (event.name.isNotEmpty && event.email.isNotEmpty && emailRegex.hasMatch(event.email)) {
      yield RegFormCanBeSubmittedState();
    }
  }

  Stream<FormStates> _mapNameValidationEventToState(NameValidationCheckEvent event) async* {
    if (event.name.isEmpty) {
      yield NameFieldEmptyState();
    } else if (event.name.isNotEmpty) {
      yield NameFieldValidState();
    }
  }

  Stream<FormStates> _mapEmailValidationEventToState(EmailValidationCheckEvent event) async* {
    final RegExp emailRegex = RegExp(r'^[a-z0-9]+([-+._][a-z0-9]+){0,2}@.*?(\.(a(?:[cdefgilmnoqrstuwxz]|ero|(?:rp|si)a)|b(?:[abdefghijmnorstvwyz]iz)|c(?:[acdfghiklmnoruvxyz]|at|o(?:m|op))|d[ejkmoz]|e(?:[ceghrstu]|du)|f[ijkmor]|g(?:[abdefghilmnpqrstuwy]|ov)|h[kmnrtu]|i(?:[delmnoqrst]|n(?:fo|t))|j(?:[emop]|obs)|k[eghimnprwyz]|l[abcikrstuvy]|m(?:[acdeghklmnopqrstuvwxyz]|il|obi|useum)|n(?:[acefgilopruz]|ame|et)|o(?:m|rg)|p(?:[aefghklmnrstwy]|ro)|qa|r[eosuw]|s[abcdeghijklmnortuvyz]|t(?:[cdfghjklmnoprtvwz]|(?:rav)?el)|u[agkmsyz]|v[aceginu]|w[fs]|y[etu]|z[amw])\b){1,2}$');

    if (event.email.isEmpty) {
      yield EmailFieldEmptyState();
    } else if (!emailRegex.hasMatch(event.email)) {
      yield EmailFieldNotValidState();
    } else if (event.email.isNotEmpty && emailRegex.hasMatch(event.email)) {
      yield EmailFieldValidState();
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
