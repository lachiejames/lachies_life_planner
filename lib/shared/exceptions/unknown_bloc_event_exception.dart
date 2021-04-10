import 'package:equatable/equatable.dart';

class UnknownBlocEventException implements Exception {
  final Equatable event;

  UnknownBlocEventException(this.event);

  @override
  String toString() {
    return 'UnknownBlocEventException($event)';
  }
}
