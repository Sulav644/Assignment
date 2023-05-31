import 'package:flutter_bloc/flutter_bloc.dart';

class IsEnabledProductUploadCubit extends Cubit<bool> {
  IsEnabledProductUploadCubit() : super(false);
  void toggleState() => emit(!state);
}
