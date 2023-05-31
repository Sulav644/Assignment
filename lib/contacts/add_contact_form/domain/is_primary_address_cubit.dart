import 'package:flutter_bloc/flutter_bloc.dart';

class IsPrimaryAddressCubit extends Cubit<bool> {
  IsPrimaryAddressCubit() : super(false);
  void toggleState() => emit(!state);
}
