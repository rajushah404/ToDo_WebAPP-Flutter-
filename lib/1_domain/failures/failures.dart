import 'package:equatable/equatable.dart';

abstract class Failures {}

class ServerFailure extends Failures with EquatableMixin {
  ServerFailure({
    this.stackTrace,
  });
  final String? stackTrace;
  @override
  List<Object?> get props => [stackTrace];
}
