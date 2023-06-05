import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSwitchCubit extends Cubit<bool> {
  ThemeSwitchCubit() : super(true);
  void toggleState() => emit(!state);
}
