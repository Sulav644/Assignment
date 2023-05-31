import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_use_type.freezed.dart';

@freezed
class FormUseType with _$FormUseType {
  const FormUseType._();
  const factory FormUseType.add() = _AddForm;
  const factory FormUseType.update() = _UpdateForm;
}
