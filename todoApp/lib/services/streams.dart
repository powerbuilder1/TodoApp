import 'dart:async';

import 'package:flutter/material.dart';

class ImageService {

  StreamController<Image> _loginImage = StreamController();

  Stream<Image> get loginImage {
    return _loginImage.stream;
  }

  void addImage(Image i) {

    this._loginImage.sink.add(i);

  }

}