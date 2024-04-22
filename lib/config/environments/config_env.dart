enum AppEnvironment { DEV, STAGING, PROD }

enum Brand { BRAND1, BRAND2 }

class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.DEV;
  static Brand _brand = Brand.BRAND1;

  static void initialize(AppEnvironment environment) {
    _environment = environment;
    _brand = _getBrandFromFlavor();
  }

  static Brand _getBrandFromFlavor() {
    // Logic to determine brand based on flavor
    String flavor = String.fromEnvironment('FLAVOR', defaultValue: '');
    if (flavor.startsWith('brand1')) {
      return Brand.BRAND1;
    } else if (flavor.startsWith('brand2')) {
      return Brand.BRAND2;
    } else {
      // Default to BRAND1 if flavor doesn't match any known pattern
      return Brand.BRAND1;
    }
  }

  static String get appName =>
      '${_environment._appTitle} ${_brand._brandTitle}';
  static String get envName => _environment._envName;
  static String get connectionString => _environment._connectionString;
  static AppEnvironment get environment => _environment;
  static Brand get brand => _brand;
  static bool get isProduction => _environment == AppEnvironment.PROD;
}

extension _EnvProperties on AppEnvironment {
  static const _appTitles = {
    AppEnvironment.DEV: 'Dev',
    AppEnvironment.STAGING: 'STAGING',
    AppEnvironment.PROD: 'Prod',
  };

  static const _connectionStrings = {
    AppEnvironment.DEV: 'https://api.spoonacular.com',
    AppEnvironment.STAGING: 'https://api.spoonacular.com',
    AppEnvironment.PROD: 'https://api.spoonacular.com',
  };

  static const _envs = {
    AppEnvironment.DEV: 'Dev',
    AppEnvironment.STAGING: 'Staging',
    AppEnvironment.PROD: 'Prod',
  };

  String get _appTitle => _appTitles[this]!;
  String get _envName => _envs[this]!;
  String get _connectionString => _connectionStrings[this]!;
}

extension _BrandProperties on Brand {
  static const _brandTitles = {
    Brand.BRAND1: 'Brand1',
    Brand.BRAND2: 'Brand2',
  };

  String get _brandTitle => _brandTitles[this]!;
}
