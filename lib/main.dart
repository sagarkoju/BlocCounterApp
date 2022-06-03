import 'package:bloc_practise/AppRouter/app_router.dart';
import 'package:bloc_practise/Presentation/screen/home_screen.dart';
import 'package:bloc_practise/Theme/cubit/theme_cubit.dart';
import 'package:bloc_practise/bloc/counter_bloc.dart';
import 'package:bloc_practise/bloc/my_bloc_observer.dart';
import 'package:bloc_practise/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  HydratedBlocOverrides.runZoned(
      () => runApp(
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => CounterCubit(),
                ),
                BlocProvider(
                  create: (context) => CounterBloc(),
                ),
                BlocProvider(
                  create: (context) => ThemeCubit(),
                ),
              ],
              child: MyApp(
                appRouter: AppRouter(),
              ),
            ),
          ),
      storage: storage,
      blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    bool isDark = themeCubit.isDark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      initialRoute: '/home',
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
