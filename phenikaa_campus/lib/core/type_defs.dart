import 'package:fpdart/fpdart.dart';
import 'package:phenikaa_campus/core/core.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;
