import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  // Endpoint for GraphQL
  static HttpLink httpLink = HttpLink(
    'https://getpeer.eu/graphql', // Your GraphQL endpoint
  );

  // Secure storage to store and retrieve tokens
  static final secureStorage = FlutterSecureStorage();

  // Method to retrieve the stored token
  static Future<String?> _getToken() async {
    return await secureStorage.read(key: 'authToken'); // Store your token under 'authToken'
  }

  // Method to create a client with AuthLink for authenticated requests
  static Future<GraphQLClient> clientToQuery() async {
    final String? token = await _getToken();

    // Adding AuthLink for token authentication
    AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer $token',
    );

    Link link = authLink.concat(httpLink);

    return GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }
}
