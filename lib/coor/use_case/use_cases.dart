import '../../../networking/api_result.dart';

abstract class UseCase<R, P> {
  Future<ApiResult<R>> call(P params);
}

class NoParams {
  const NoParams();
}
