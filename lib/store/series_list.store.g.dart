// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_list.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SeriesListStore on _SeriesListStore, Store {
  late final _$listAtom = Atom(name: '_SeriesListStore.list', context: context);

  @override
  List<Series> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<Series> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$isFetchingAtom =
      Atom(name: '_SeriesListStore.isFetching', context: context);

  @override
  bool get isFetching {
    _$isFetchingAtom.reportRead();
    return super.isFetching;
  }

  @override
  set isFetching(bool value) {
    _$isFetchingAtom.reportWrite(value, super.isFetching, () {
      super.isFetching = value;
    });
  }

  late final _$fetchErrorAtom =
      Atom(name: '_SeriesListStore.fetchError', context: context);

  @override
  bool get fetchError {
    _$fetchErrorAtom.reportRead();
    return super.fetchError;
  }

  @override
  set fetchError(bool value) {
    _$fetchErrorAtom.reportWrite(value, super.fetchError, () {
      super.fetchError = value;
    });
  }

  late final _$_SeriesListStoreActionController =
      ActionController(name: '_SeriesListStore', context: context);

  @override
  void fillList() {
    final _$actionInfo = _$_SeriesListStoreActionController.startAction(
        name: '_SeriesListStore.fillList');
    try {
      return super.fillList();
    } finally {
      _$_SeriesListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void triggerError() {
    final _$actionInfo = _$_SeriesListStoreActionController.startAction(
        name: '_SeriesListStore.triggerError');
    try {
      return super.triggerError();
    } finally {
      _$_SeriesListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopFetching() {
    final _$actionInfo = _$_SeriesListStoreActionController.startAction(
        name: '_SeriesListStore.stopFetching');
    try {
      return super.stopFetching();
    } finally {
      _$_SeriesListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list},
isFetching: ${isFetching},
fetchError: ${fetchError}
    ''';
  }
}
