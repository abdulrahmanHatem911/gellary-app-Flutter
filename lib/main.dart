import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/cache_helper.dart';
import 'presentation/controller/Login/login_bloc.dart';
import 'presentation/controller/galleryBloc/gallery_bloc.dart';
import 'presentation/controller/galleryBloc/gallery_event.dart';

import 'core/routers/app_routers.dart';
import 'core/services/services_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  ServicesLocator().init();
  String startRouter;
  String token = await CacheHelper.getData('token') ?? '';
  print('token: $token');
  if (token != '') {
    startRouter = Routers.galleryScreen;
  } else {
    startRouter = Routers.loginScreen;
  }
  runApp(MyApp(router: startRouter));
}

class MyApp extends StatelessWidget {
  final String router;
  const MyApp({
    super.key,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<LoginBloc>()),
        BlocProvider(
            create: (context) => sl<GalleryBloc>()..add(GetGalleryEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: RoutersGenerated.onGenerateRoute,
        initialRoute: router,
      ),
    );
  }
}
