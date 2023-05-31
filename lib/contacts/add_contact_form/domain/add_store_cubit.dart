import 'package:flutter_bloc/flutter_bloc.dart';

class AddStoreCubit extends Cubit<List<int>> {
  AddStoreCubit() : super([]);
  void addStore() {
    int index = state.length;
    List<int> list = state;
    state.add(index);
    emit([...list]);
  }

  void removeStore() {
    List<int> list = state;
    list.removeAt(0);
    emit([...list]);
  }
}
