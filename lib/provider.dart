class ProviderFactory<T> {
  final T Function() _provider;

  factory ProviderFactory(T Function() provider) => ProviderFactory._(
    provider,
  );

  ProviderFactory._(this._provider);

  T call() => _provider.call();
}

class ProviderSingleton<T> {
  // ignore: unused_field
  final T Function() _provider;
  T _instance;

  factory ProviderSingleton(T Function() provider) => ProviderSingleton._(
    provider,
    provider.call(),
  );

  ProviderSingleton._(this._provider, this._instance);

  T call() => _instance;
}

class ProviderLazySingleton<T> {
  final T Function() _provider;
  T? _instance;

  factory ProviderLazySingleton(T Function() provider) =>
      ProviderLazySingleton._(provider, null);

  ProviderLazySingleton._(this._provider, this._instance);

  T call() => _instance ??= _provider.call();
}
