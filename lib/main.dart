import 'package:assigment2/screens/onBoard/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import './screens/signin/sign_in_screen.dart';
import './screens/signup/sign_up_screen.dart';
import './screens/forgot_password/forgot_password_screen.dart';
import './screens/resetpassword/reset_pass_screen.dart';
import './screens/dashboard/dashboard_screen.dart';
import './screens/addnews/add_news.dart';
import 'package:provider/provider.dart';
import './api/provider/selectmatch_provider.dart';
import './screens/dashboard/bottom_Navigation_pages/news_page/news_page.dart';
import 'api/api_service/auth_service.dart';
import './api/provider/news_provider.dart';

void main() {
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<SelectMatchProvider>(
        create: (context) => SelectMatchProvider(),)
,        ChangeNotifierProvider<NewsProvider>(
        create: (context) => NewsProvider(),)],
      
        child: MaterialApp(
          title: 'Assignment 2',
          home: FutureBuilder(
            future: AuthApiService.tryAutoLogin(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.data == true) {
                  return const DashBoardScreen();
                } else {
                  return OnBoardingScreen();
                }
              }
            },
          ),
          routes: {
            SignInScreen.routeName: (context) => const SignInScreen(),
            SignUpScreen.routename: (context) => const SignUpScreen(),
            ForgotPasswordScreen.routeName: (context) =>
                const ForgotPasswordScreen(),
            ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
            DashBoardScreen.routeName: (context) => const DashBoardScreen(),
            AddNewsScreen.routeName: (context) => const AddNewsScreen(),
            NewsPage.routeName: (context) => const NewsPage(),
          },
        ),
      
    );
  }
}
