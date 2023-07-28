// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsStore on _DetailsStore, Store {
  late final _$seriesAtom =
      Atom(name: '_DetailsStore.series', context: context);

  @override
  Series? get series {
    _$seriesAtom.reportRead();
    return super.series;
  }

  @override
  set series(Series? value) {
    _$seriesAtom.reportWrite(value, super.series, () {
      super.series = value;
    });
  }

  late final _$isFetchingAtom =
      Atom(name: '_DetailsStore.isFetching', context: context);

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
      Atom(name: '_DetailsStore.fetchError', context: context);

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

  late final _$_DetailsStoreActionController =
      ActionController(name: '_DetailsStore', context: context);

  @override
  void getDetails(Series selectedSeries) {
    final _$actionInfo = _$_DetailsStoreActionController.startAction(
        name: '_DetailsStore.getDetails');
    try {
      return super.getDetails(selectedSeries);
    } finally {
      _$_DetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void triggerError() {
    final _$actionInfo = _$_DetailsStoreActionController.startAction(
        name: '_DetailsStore.triggerError');
    try {
      return super.triggerError();
    } finally {
      _$_DetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopFetching() {
    final _$actionInfo = _$_DetailsStoreActionController.startAction(
        name: '_DetailsStore.stopFetching');
    try {
      return super.stopFetching();
    } finally {
      _$_DetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
series: ${series},
isFetching: ${isFetching},
fetchError: ${fetchError}
    ''';
  }
}
