import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'data.dart';
import 'data_failure.dart';
import 'fresh.dart';
import 'payloads.dart';

part 'data_notifier.freezed.dart';

typedef DataGetter = Future<Either<DataFailure, Fresh<List<Data>>>> Function();
typedef SingleDataGetter = Future<Either<DataFailure, Fresh<Data>>> Function();

@freezed
class PagedDataState with _$PagedDataState {
  const PagedDataState._();
  const factory PagedDataState.initial(Fresh<List<Data>> data) = _Initial;
  const factory PagedDataState.loadInProgress(Fresh<List<Data>> data) =
      _LoadInProgress;
  const factory PagedDataState.loadSuccess(Fresh<List<Data>> data) =
      _LoadSuccess;
  const factory PagedDataState.loadFailure(Fresh<List<Data>> data) =
      _LoadFailure;
}

@freezed
class SinglePagedDataState with _$SinglePagedDataState {
  const SinglePagedDataState._();
  const factory SinglePagedDataState.initial(Fresh<Data> data) = _SingleInitial;
  const factory SinglePagedDataState.loadInProgress(Fresh<Data> data) =
      _SingleLoadInProgress;
  const factory SinglePagedDataState.loadSuccess(Fresh<Data> data) =
      _SingleLoadSuccess;
  const factory SinglePagedDataState.loadFailure(Fresh<Data> data) =
      _SingleLoadFailure;
}

class PagedDataNotifier extends Cubit<PagedDataState> {
  PagedDataNotifier() : super(PagedDataState.initial(Fresh.yes(const [])));
  Future<void> getPage(DataGetter getter) async {
    emit(PagedDataState.loadInProgress(state.data));

    final failureOrData = await getter();
    emit(failureOrData.fold((l) => PagedDataState.loadFailure(state.data),
        (r) => PagedDataState.loadSuccess(r.copyWith(entity: [...r.entity]))));
  }
}

class SinglePagedDataNotifier extends Cubit<SinglePagedDataState> {
  SinglePagedDataNotifier()
      : super(SinglePagedDataState.initial(Fresh.yes(data)));
  Future<void> getPage(SingleDataGetter getter) async {
    emit(SinglePagedDataState.loadInProgress(state.data));

    final failureOrData = await getter();
    emit(failureOrData.fold((l) => SinglePagedDataState.loadFailure(state.data),
        (r) => SinglePagedDataState.loadSuccess(r.copyWith(entity: r.entity))));
  }
}
