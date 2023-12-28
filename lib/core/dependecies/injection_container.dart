import 'package:get_it/get_it.dart';
import 'package:hadeeth/core/network/netwotk_info.dart';
import 'package:hadeeth/src/category/data/data%20source/category_remote_date_source.dart';
import 'package:hadeeth/src/category/data/repository/category_repository_impl.dart';
import 'package:hadeeth/src/category/domain/repository/category_repository.dart';
import 'package:hadeeth/src/category/domain/usecases/all_categories_usecase.dart';
import 'package:hadeeth/src/category/domain/usecases/category_detail_usecase.dart';
import 'package:hadeeth/src/category/presentation/blocs/category/category_bloc.dart';
import 'package:hadeeth/src/category/presentation/blocs/category_detail/category_detail_bloc.dart';
import 'package:hadeeth/src/hadeeth/data/data%20source/hadeeth_data_source.dart';
import 'package:hadeeth/src/hadeeth/data/repository/hadeeth_repository_impl.dart';
import 'package:hadeeth/src/hadeeth/domain/repository/hadeeth_repository.dart';
import 'package:hadeeth/src/hadeeth/domain/usecases/hadeeth_usecase.dart';
import 'package:hadeeth/src/hadeeth/presentation/blocs/hadeeth/hadeeth_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());

  // Categories & CategoryDetail
  // Bloc
  sl.registerFactory(() => CategoryBloc(allCategoriesUsecase: sl()));
  sl.registerFactory(() => CategoryDetailBloc(categoryDetailUsecase: sl()));
  // Usecase
  sl.registerLazySingleton(() => AllCategoriesUsecase(categoryRepo: sl()));
  sl.registerLazySingleton(() => CategoryDetailUsecase(categoryRepo: sl()));
  // Repository
  sl.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(
      networkInfo: sl(), categoryRemoteDataSource: sl()));
  // Data Source
  sl.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSourceImpl(client: sl()));

  // Hadeeth
  // Bloc
  sl.registerFactory(() => HadeethBloc(hadeethUsecase: sl()));
  // Usecase
  sl.registerLazySingleton(() => HadeethUsecase(hadeethRepository: sl()));
  // Repository
  sl.registerLazySingleton<HadeethRepository>(
      () => HadeethRepositoryImpl(hadeethDataSource: sl()));
  // Datasource
  sl.registerLazySingleton<HadeethDataSource>(
      () => HadeethDataSourceImpl(client: sl()));
}
