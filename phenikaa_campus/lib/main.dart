import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phenikaa_campus/common/common.dart';
import 'package:phenikaa_campus/features/auth/controller/auth_controller.dart';
import 'package:phenikaa_campus/features/auth/view/login_view.dart';
import 'package:phenikaa_campus/features/auth/view/signup_view.dart';
import 'package:phenikaa_campus/features/home/view/home_view.dart';
import 'package:phenikaa_campus/theme/theme.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Phenikaa Campus',
        theme: AppTheme.theme,
        home: ref.watch(currentUserAccountProvider).when(
            data: (user) {
              if (user != null) {
                return const LoginView();
              } else {
                return const SignUpView();
              }
            },
            loading: () => const LoadingPage(),
            error: (error, s) {
              return ErrorText(
                error: error.toString(),
              );
            }));
  }
}
