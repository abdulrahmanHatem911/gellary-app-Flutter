import '../../data/data%20source/remote/remote_data_source.dart';
import '../../data/repository/gallery_repository.dart';
import '../../domain/repository/base_gallery_repository.dart';
import '../../domain/use%20case/login_resopnse_ues_case.dart';
import 'package:get_it/get_it.dart';

import '../../domain/use case/get_gallery_use_case.dart';
import '../../presentation/controller/Login/login_bloc.dart';
import '../../presentation/controller/galleryBloc/gallery_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // to bloc
    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerFactory(() => GalleryBloc(sl()));
    // use case
    sl.registerLazySingleton(() => LoginResponseUseCase(sl()));
    sl.registerLazySingleton(() => GetGalleryUseCase(sl()));
    // repository
    sl.registerLazySingleton<BaseGalleryRepository>(
        () => GalleryRepository(sl()));

    ///DataSources
    sl.registerLazySingleton<BaseRemoteGalleryDataSource>(
        () => RemoteGalleryDataSource());
  }
}
