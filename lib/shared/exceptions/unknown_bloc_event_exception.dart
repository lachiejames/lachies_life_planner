import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class UnknownBlocEventException implements Exception {
  final Equatable event;

  UnknownBlocEventException(this.event);

  @override
  String toString() {
    return 'UnknownBlocEventException($event)';
  }
}
