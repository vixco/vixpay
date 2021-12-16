
import 'dart:collection';

import 'package:flutter/material.dart';

class TenderKeypadFormManager {
  Map<dynamic, _TextFormData> _formData = HashMap<dynamic, _TextFormData>();
  List _formOrder =[];
  dynamic _current;
  dynamic _firstFocus;
  Function? _onKeypadFocus;

  void registerForm(dynamic id,
      {bool autoFocus = false,
        String? label,
        String? max,
        Function? onFocus,
        Function? onInput,
        Function? isEnable}) {
    _formData.putIfAbsent(id, () {
      _formOrder.add(id);
      return _TextFormData(
          label: label, max: max, onFocus: onFocus, onInput: onInput, isEnable: isEnable);
    });

    if (autoFocus) {
      _current = id;
      _firstFocus = id;
      focus(id);
    }
  }

  void registerKeypad({Function? onFocus}) {
    _onKeypadFocus = onFocus;
  }

  void reset() {
    focus(_firstFocus);
  }

  // id 가 null 인 경우 unfocus
  void focus(dynamic id) {
    String? prev = '';
    String? next = '';
    _TextFormData? form = _formData[_current];

    if (form != null) {
      prev = form.label;

      if (form.onFocus != null) {
        form.onFocus!(false);
      }
    }

    if (id != null) {
      form = _formData[id];
    }

    if (form != null) {
      next = form.label;

      if (form.onFocus != null) {
        form.onFocus!(true);
      }
    }

    _current = id;

    if (_onKeypadFocus != null) {
      _onKeypadFocus!();
    }

    debugPrint('[TenderKeypadFormManager]focus change: [$prev] => [$next]');
  }

  void focusNext(bool next) {
    if (_formOrder.length < 2) {
      return;
    }

    var index = _current != null ? _formOrder.indexOf(_current) : 0;

    if (next) {
      if (++index >= _formOrder.length) {
        index = 0;
      }
    } else {
      if (--index < 0) {
        index = _formOrder.length - 1;
      }
    }

    focus(_formOrder[index]);
  }

  String get label => (_current != null ? _formData[_current]!.label : null) ?? '';

  String get max => (_current != null ? _formData[_current]!.max : null) ?? '0';

  Function? get onInput => _current != null ? _formData[_current]!.onInput : null;

  bool? get isEnable => _current != null ? _formData[_current]!.isEnable!() : true;
}

class _TextFormData {
  final String? label;
  final String? max;
  final Function? onFocus;
  final Function? onInput;
  final Function? isEnable;

  _TextFormData({this.label, this.max, this.onFocus, this.onInput, this.isEnable});
}