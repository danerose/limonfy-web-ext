import 'package:limonfy/app/domain/entities/config/local_config.entity.dart';
import 'package:limonfy/app/domain/repositories/config/config.repository.dart';

class GetLocalConfigUsecase {
  final ConfigReponsitory configReponsitory;

  GetLocalConfigUsecase({required this.configReponsitory});

  Future<LocalConfig> execute() async {
    return await configReponsitory.getLocalConfig();
  }
}
