import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'landing_page/login/login_screen.dart';
import 'landing_page/register/register_screen.dart';
import 'landing_page/forgot_password_screen.dart';
import 'landing_page/register/graphql_client.dart';

void main() async {
  // Initialize Hive for Flutter (required by graphql_flutter for caching)
  await initHiveForFlutter();

  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(GraphQLConfig.clientToQuery() as GraphQLClient),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(), // Initial screen is the LoginScreen
        routes: {
          '/register': (context) => RegisterScreen(), // Route for the RegisterScreen
          '/forgot-password': (context) => ForgotPasswordScreen(), // Route for ForgotPasswordScreen
        },
      ),
    );
  }
}
