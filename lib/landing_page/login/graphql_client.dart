import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

Future<GraphQLClient> getGraphQLClient() async {
  final HttpLink httpLink = HttpLink('https://getpeer.eu/graphql');

  // Retrieve the token from secure storage if available
  String? token = await storage.read(key: 'authToken');
  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer $token',
  );

  final Link link = authLink.concat(httpLink);
  
  return GraphQLClient(
    link: link,
    cache: GraphQLCache(),
  );
}
