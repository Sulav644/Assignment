import 'data.dart';

extension DTOListToDomainList on List<DataDto> {
  List<Data> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}

extension DTOToDomain on DataDto {
  Data toSingleDomain() {
    return toDomain();
  }
}
