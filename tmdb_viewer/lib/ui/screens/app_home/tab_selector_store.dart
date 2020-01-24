import 'package:mobx/mobx.dart';
part 'tab_selector_store.g.dart';

class TabSelectorStore = TabSelectorStoreBase with _$TabSelectorStore;

abstract class TabSelectorStoreBase with Store {
  @observable
  int activeTabIndex = 0;

  @action
  void setTabIndex(int index) {
    activeTabIndex = index;
  }
}
