import 'package:flutter_bloc/flutter_bloc.dart';

class CongimentPageChangeCubit extends Cubit<int> {
  CongimentPageChangeCubit() : super(0);
  void changePage() {
    emit(state + 1);
  }

  void previousPage() {
    emit(state - 1);
  }

  void initPage() {
    emit(0);
  }
}
