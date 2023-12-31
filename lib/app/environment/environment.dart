import 'base_config/i_env_base_config.dart';
import 'package:weather_forecast/app/environment/base_config/env_base_config.dart';

class Environment {
  Environment._internal();
  static final Environment instance = Environment._internal();

  late IEnvBaseConfig config;

  IEnvBaseConfig initConfig({required EEnvType environment, required String apiUrl, required String apiKey}) {
    config = _getConfig(environment, apiUrl, apiKey);
    return config;
  }

  IEnvBaseConfig _getConfig(EEnvType environment, String apiUrl, String apiKey) {
    IEnvBaseConfig config = switch (environment) {
      EEnvType.dev => EnvBaseConfig.dev(),
      EEnvType.prod => EnvBaseConfig.prod(),
    };

    config.setApiConfig(apiUrl: apiUrl, apiKey: apiKey);
    return config;
  }
}

extension XEnvironment on String {
  EEnvType getEnvType() {
    if (this == EEnvType.dev.description) return EEnvType.dev;
    if (this == EEnvType.prod.description) return EEnvType.prod;

    return EEnvType.dev;
  }
}
