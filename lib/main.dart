import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:language_builder/language_builder.dart';
import 'package:mfecinternship/feature/home/presentation/pages/home_pages.dart';
import 'common/Language/language.dart';
import 'common/config/app_route.dart';
import 'common/function/injection_container.dart' as di;
import 'feature/auth/cubit/auth/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  await di.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider<AuthCubit>(
          create: (_) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider<CredentialCubit>(
          create: (_) => di.sl<CredentialCubit>(),
        ),
        BlocProvider<CredentialAuthCubit>(
          create: (_) => di.sl<CredentialAuthCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoute().getAll,
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, authstate) {
            if (authstate is Authenticated) {
              return LanguageBuilder(
                  defaultLanguage: 'en',
                  useDeviceLanguage: false,
                  textsMap: Languages.languages,
                  child: HomePage(uid: authstate.uid));
            } else {
              return LanguageBuilder(
                  defaultLanguage: 'en',
                  useDeviceLanguage: false,
                  textsMap: Languages.languages,
                  child: LoginPage());
            }
          },
        ),
      ),
    );
  }
}
