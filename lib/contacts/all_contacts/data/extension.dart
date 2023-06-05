import 'models/data.dart';

extension DTOListToDomainList on List<DataDto> {
  List<Data> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
