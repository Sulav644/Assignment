import 'package:flutter_bloc/flutter_bloc.dart';

import '../../all_contacts/data/models/add_data.dart';

class StoreTempListCubit extends Cubit<StoreTempDataList> {
  StoreTempListCubit()
      : super(
            const StoreTempDataList(data: [StoreTempData(index: 0, text: '')]));
  void addData({required String text}) {
    int index = state.data.length;
    StoreTempData data = StoreTempData(index: index, text: text);
    List<StoreTempData> list = [...state.data, data];

    emit(state.copyWith(data: list));
  }

  void editData({required int index, required String text}) {
    StoreTempData data = state.data[index].copyWith(index: index, text: text);
    List<StoreTempData> filteredList = [];
    for (var element in state.data) {
      if (element.index != index) {
        filteredList.add(element);
      }
    }
    filteredList.insert(index, data);
    emit(state.copyWith(data: filteredList));
  }

  void deleteData() {
    List<StoreTempData> filteredList = [];
    for (var element in state.data) {
      filteredList.add(element);
    }
    filteredList.removeAt(0);
    emit(state.copyWith(data: filteredList));
  }
}
