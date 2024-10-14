import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static HttpLink httpLink = HttpLink(
    'https://getpeer.eu/graphql', // Ersetze mit deinem GraphQL-Endpoint
  );

  static GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: httpLink,
    );
  }
}
