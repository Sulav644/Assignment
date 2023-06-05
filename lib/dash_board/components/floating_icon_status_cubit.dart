import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmedPickupCubit extends Cubit<bool> {
  ConfirmedPickupCubit() : super(false);
  void setPickedup() {
    emit(true);
    print(state);
  }

  void setNotPickedUp() {
    emit(false);
  }
}
