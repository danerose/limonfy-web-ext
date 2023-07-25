import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:limonfy/core/env/env.dart';
import 'package:limonfy/core/config/size/size.config.dart';
import 'package:limonfy/core/constants/limonfy.constants.dart';

import 'package:limonfy/core/services/db/hive.service.dart';
import 'package:limonfy/core/services/network/network.service.dart';

import 'package:limonfy/core/constants/icons.constants.dart';
import 'package:limonfy/core/constants/colors.constants.dart';

import 'package:limonfy/app/domain/usecases/auth/login.usecase.dart';
import 'package:limonfy/app/domain/usecases/auth/verify.usecase.dart';
import 'package:limonfy/app/domain/usecases/user/get_user_account.usecase.dart';
import 'package:limonfy/app/domain/usecases/user/get_user_profile.usecase.dart';
import 'package:limonfy/app/domain/usecases/config/get_local_config.usecase.dart';
import 'package:limonfy/app/domain/usecases/links/verify_exist_link.usecase.dart';
import 'package:limonfy/app/domain/usecases/links/convert_link_from_js.usecase.dart';
import 'package:limonfy/app/domain/usecases/links/create_limonfy_app_link.usecase.dart';
import 'package:limonfy/app/domain/usecases/user/get_user_account_subscription.usecase.dart';
import 'package:limonfy/app/domain/usecases/collections/get_featured_collections.usecase.dart';
import 'package:limonfy/app/domain/usecases/collections/get_featured_local_collections.usecase.dart';

import 'package:limonfy/app/domain/repositories/auth/auth.repository.dart';
import 'package:limonfy/app/domain/repositories/links/links.repository.dart';
import 'package:limonfy/app/domain/repositories/config/config.repository.dart';
import 'package:limonfy/app/domain/repositories/users/user_profile.repository.dart';
import 'package:limonfy/app/domain/repositories/users/user_account.repository.dart';
import 'package:limonfy/app/domain/repositories/collections/collections.repository.dart';

import 'package:limonfy/app/data/repositories/auth/auth.repository.impl.dart';
import 'package:limonfy/app/data/repositories/links/links.repository.impl.dart';
import 'package:limonfy/app/data/repositories/config/config.repository.impl.dart';
import 'package:limonfy/app/data/repositories/users/user_profile.repository.impl.dart';
import 'package:limonfy/app/data/repositories/users/user_account.repository.impl.dart';
import 'package:limonfy/app/data/repositories/collections/collections.repository.impl.dart';

import 'package:limonfy/app/data/datasources/local/interface/user/user.local.source.dart';
import 'package:limonfy/app/data/datasources/local/interface/links/links.local.source.dart';
import 'package:limonfy/app/data/datasources/remote/interface/user/user_profile.source.dart';
import 'package:limonfy/app/data/datasources/remote/interface/user/user_account.source.dart';
import 'package:limonfy/app/data/datasources/local/interface/config/config.local.source.dart';
import 'package:limonfy/app/data/datasources/local/interface/subscription/subscription.local.source.dart';

import 'package:limonfy/app/data/datasources/remote/interface/auth/auth.remote.source.dart';
import 'package:limonfy/app/data/datasources/remote/interface/links/links.remote.source.dart';
import 'package:limonfy/app/data/datasources/local/interface/collection/collections.local.source.dart';
import 'package:limonfy/app/data/datasources/remote/interface/collections/collections.remote.source.dart';

import 'package:limonfy/app/data/datasources/local/implementation/user/user.local.source.impl.dart';
import 'package:limonfy/app/data/datasources/remote/implementation/auth/auth.remote.source.impl.dart';
import 'package:limonfy/app/data/datasources/local/implementation/links/links.local.source.impl.dart';
import 'package:limonfy/app/data/datasources/remote/implementation/users/user_profile.source.impl.dart';
import 'package:limonfy/app/data/datasources/remote/implementation/links/links.remote.source.impl.dart';
import 'package:limonfy/app/data/datasources/remote/implementation/users/user_account.source.impl.dart';
import 'package:limonfy/app/data/datasources/local/implementation/config/config.local.source.impl.dart';
import 'package:limonfy/app/data/datasources/local/implementation/collection/collections.local.source.impl.dart';
import 'package:limonfy/app/data/datasources/remote/implementation/collections/collections.remote.source.impl.dart';
import 'package:limonfy/app/data/datasources/local/implementation/subscription/subscription.local.source.impl.dart';

final injector = GetIt.instance;

Future<void> init(Env env) async {
  injector.registerSingleton<Env>(env);
  injector.registerSingleton<SizeConfig>(SizeConfig());
  injector.registerSingleton<IconsConstants>(IconsConstants(env: env.env));
  injector.registerSingleton<ColorsConstants>(ColorsConstants(env: env.env));
  injector.registerSingleton<LimonfyConstants>(LimonfyConstants(env: env.env));

  injector.registerSingleton<HiveService>(HiveService(key: env.encryptKeyHive));
  injector.registerSingleton<HttpService>(
    HttpService(
      baseUrl: env.apiURL,
      dio: Dio(),
    ),
  );

  //Auth
  _configDependencies();
  _userDependencies();
  _authDependencies();
  _collectionsDependencies();
  _linkDependencies();
}

void _configDependencies() {
  injector.registerLazySingleton<ConfigLocalSource>(
    () => ConfigLocalSourceImpl(
      hive: injector.get<HiveService>(),
    ),
  );
  injector.registerLazySingleton<ConfigReponsitory>(
    () => ConfigReponsitotyImpl(
      configLocalSource: injector.get<ConfigLocalSource>(),
    ),
  );
  injector.registerLazySingleton<GetLocalConfigUsecase>(
    () => GetLocalConfigUsecase(
      configReponsitory: injector.get<ConfigReponsitory>(),
    ),
  );
}

void _authDependencies() {
  injector.registerLazySingleton<AuthRemoteSource>(
    () => AuthRemoteSourceImpl(
      dio: injector.get<HttpService>(),
    ),
  );
  injector.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteSource: injector.get<AuthRemoteSource>(),
      userLocalSource: injector.get<UserLocalSource>(),
      configLocalSource: injector.get<ConfigLocalSource>(),
    ),
  );
  injector.registerLazySingleton<LocalLogInUsecase>(
    () => LocalLogInUsecase(authRepository: injector.get<AuthRepository>()),
  );

  injector.registerLazySingleton<VerifyOtpAuthUsecase>(
    () => VerifyOtpAuthUsecase(authRepository: injector.get<AuthRepository>()),
  );

  injector.registerLazySingleton<VerifySendOtherAuthUsecase>(
    () => VerifySendOtherAuthUsecase(
      authRepository: injector.get<AuthRepository>(),
    ),
  );
}

void _userDependencies() {
  injector.registerLazySingleton<SubscriptionLocalSource>(
    () => SubscriptionLocalSourceImpl(hive: injector.get<HiveService>()),
  );

  injector.registerLazySingleton<UserLocalSource>(
    () => UserLocalSourceImpl(hive: injector.get<HiveService>()),
  );

  injector.registerLazySingleton<UserAccountRemoteSource>(
    () => UserAccountServiveImpl(
      dio: injector.get<HttpService>(),
      hive: injector.get<HiveService>(),
    ),
  );

  injector.registerLazySingleton<UserProfileRemoteSource>(
    () => UserProfileServiveImpl(
      dio: injector.get<HttpService>(),
      hive: injector.get<HiveService>(),
    ),
  );

  injector.registerLazySingleton<UserProfileRepository>(
    () => UserProfileRepositoryImpl(
      userProfileRemoteSource: injector.get<UserProfileRemoteSource>(),
      userLocalSource: injector.get<UserLocalSource>(),
    ),
  );

  injector.registerLazySingleton<UserAccountRepository>(
    () => UserAccountRepositoryImpl(
      userLocalSource: injector.get<UserLocalSource>(),
      userAccountRemoteSource: injector.get<UserAccountRemoteSource>(),
      subscriptionLocalSource: injector.get<SubscriptionLocalSource>(),
    ),
  );

  injector.registerLazySingleton<GetUserAccountUsecase>(
    () => GetUserAccountUsecase(
      userRepository: injector.get<UserAccountRepository>(),
    ),
  );

  injector.registerLazySingleton<GetUserProfileUsecase>(
    () => GetUserProfileUsecase(
      userRepository: injector.get<UserProfileRepository>(),
    ),
  );

  injector.registerLazySingleton<GetUserAccountSubscriptionUsecase>(
    () => GetUserAccountSubscriptionUsecase(
      userAccountRepository: injector.get<UserAccountRepository>(),
    ),
  );
}

void _collectionsDependencies() {
  injector.registerLazySingleton<CollectionsLocalSource>(
    () => CollectionsLocalSourceImpl(
      hive: injector.get<HiveService>(),
    ),
  );

  injector.registerLazySingleton<CollectionsRemoteSource>(
    () => CollectionRemoteSourceImpl(
      hive: injector.get<HiveService>(),
      dio: injector.get<HttpService>(),
    ),
  );

  injector.registerLazySingleton<CollectionsRepository>(
    () => CollectionsRepositoryImpl(
      configLocalSource: injector.get<ConfigLocalSource>(),
      collectionsLocalSource: injector.get<CollectionsLocalSource>(),
      collectionsRemoteSource: injector.get<CollectionsRemoteSource>(),
    ),
  );

  injector.registerLazySingleton<GetLocalFeatureCollectionUsecase>(
    () => GetLocalFeatureCollectionUsecase(
      collectionsRepository: injector.get<CollectionsRepository>(),
    ),
  );

  injector.registerLazySingleton<GetFeaturedCollectionUsecase>(
    () => GetFeaturedCollectionUsecase(
      collectionsRepository: injector.get<CollectionsRepository>(),
    ),
  );
}

void _linkDependencies() {
  injector.registerLazySingleton<LinksLocalSource>(
    () => LinksLocalSourceImpl(),
  );
  injector.registerLazySingleton<LinksRemoteSource>(
    () => LinksRemoteSourceImpl(
      hive: injector.get<HiveService>(),
      dio: injector.get<HttpService>(),
    ),
  );

  injector.registerLazySingleton<LinksRepository>(
    () => LinksRepositoryImpl(
      linksLocalSource: injector.get<LinksLocalSource>(),
      linksRemoteSource: injector.get<LinksRemoteSource>(),
    ),
  );

  injector.registerLazySingleton<VerifyExistLinkUsecase>(
    () => VerifyExistLinkUsecase(
      linksRepository: injector.get<LinksRepository>(),
    ),
  );

  injector.registerLazySingleton<ConvertLinkFromJsUsecase>(
    () => ConvertLinkFromJsUsecase(
      linksRepository: injector.get<LinksRepository>(),
    ),
  );

  injector.registerLazySingleton<CreateLimonfyAppLinkUsecase>(
    () => CreateLimonfyAppLinkUsecase(
      linksRepository: injector.get<LinksRepository>(),
    ),
  );
}
