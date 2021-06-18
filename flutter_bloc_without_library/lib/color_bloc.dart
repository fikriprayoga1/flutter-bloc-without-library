import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { amber, blue }

class ColorBloc {
  Color _color = Colors.amber;

  StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateController.sink;
  Stream<Color> get stateStream => _stateController.stream;

  ColorBloc() {
    _eventController.stream.listen((event) {
      if (event == ColorEvent.amber) {
        _color = Colors.amber;
      } else {
        _color = Colors.blue;
      }

      _stateSink.add(_color);
    });
  }

  dispose() {
    _eventController.close();
    _stateController.close();
  }
}
