import 'package:get_storage/get_storage.dart';
import 'package:nailed_it/data/provider/user/user_local_provider.dart';

class UserLocalProviderImpl implements UserLocalProvider {
  UserLocalProviderImpl({
    required GetStorage storage,
  }) : _storage = storage;

  final GetStorage _storage;

  @override
  Future<void> onInit() async {
    await _storage.writeIfNull(ULPExtension.isFirstRun, true);
  }

  @override
  bool getFirstRun() {
    return _storage.read(ULPExtension.isFirstRun)!;
  }

  @override
  Future<void> setFirstRun(bool isFirstRun) {
    return _storage.write(ULPExtension.isFirstRun, isFirstRun);
  }
}

extension ULPExtension on UserLocalProvider {
  static const String isFirstRun = 'is_first_run';
}
