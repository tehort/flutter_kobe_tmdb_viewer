// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_selector_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TabSelectorStore on TabSelectorStoreBase, Store {
  final _$activeTabIndexAtom =
      Atom(name: 'TabSelectorStoreBase.activeTabIndex');

  @override
  int get activeTabIndex {
    _$activeTabIndexAtom.context.enforceReadPolicy(_$activeTabIndexAtom);
    _$activeTabIndexAtom.reportObserved();
    return super.activeTabIndex;
  }

  @override
  set activeTabIndex(int value) {
    _$activeTabIndexAtom.context.conditionallyRunInAction(() {
      super.activeTabIndex = value;
      _$activeTabIndexAtom.reportChanged();
    }, _$activeTabIndexAtom, name: '${_$activeTabIndexAtom.name}_set');
  }

  final _$TabSelectorStoreBaseActionController =
      ActionController(name: 'TabSelectorStoreBase');

  @override
  void setTabIndex(int index) {
    final _$actionInfo = _$TabSelectorStoreBaseActionController.startAction();
    try {
      return super.setTabIndex(index);
    } finally {
      _$TabSelectorStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
