import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { to_green, to_red }

class ColorBloc with ChangeNotifier {
  Color _color = Colors.green;

  StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();

  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  StreamController<Color> _stateColorController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateColorController.sink;
  Stream<Color> get stateColorStream => _stateColorController.stream;

  void _getColor(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.to_green)
      _color = Colors.green;
    else
      _color = Colors.red;

    _stateSink.add(_color);
  }

  ColorBloc() {
    _eventController.stream.listen(_getColor);
  }

  @override
  void dispose() {
    _eventController?.close();
    _stateColorController?.close();
    super.dispose();
  }
}
