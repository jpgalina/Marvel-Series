import 'package:marvel_api/api/api.dart';
import 'package:marvel_api/model/series.dart';
import 'package:mobx/mobx.dart';

part 'details.store.g.dart';

class DetailsStore = _DetailsStore with _$DetailsStore;

abstract class _DetailsStore with Store {
  @observable
  Series? series;

  @observable
  bool isFetching = false;

  @observable
  bool fetchError = false;

  @action
  void getDetails(Series selectedSeries) {
    isFetching = true;
    API.getSeriesById(selectedSeries).then((value) {
      stopFetching();
      series = value;
      if (series == null) {
        triggerError();
      } else {
        reset();
      }
    });
  }

  void reset() {
    fetchError = false;
  }

  @action
  void triggerError() {
    fetchError = true;
  }

  @action
  void stopFetching() {
    isFetching = false;
  }
}
