import 'package:flutter_bloc/flutter_bloc.dart';

class IsDefaultBranchLocationCubit extends Cubit<bool> {
  IsDefaultBranchLocationCubit() : super(true);
  void toggleState() => emit(!state);
}
