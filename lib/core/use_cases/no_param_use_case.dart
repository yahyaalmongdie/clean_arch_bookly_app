
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class NoParamUseCase<Type> {
  Future<Either<Failure, Type>> call();
}
