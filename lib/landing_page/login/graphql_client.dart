import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

Future<GraphQLClient> getGraphQLClient() async {
  // Verwende die angepasste Proxy-URL mit dem richtigen Port
  final HttpLink httpLink = HttpLink('https://getpeer.eu/graphql');

  // Authentifizierungstoken aus dem Secure Storage abrufen (falls vorhanden)
  String? token = await storage.read(key: 'authToken');
  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer $token',
  );

  // Verknüpfe den AuthLink mit dem HttpLink
  final Link link = authLink.concat(httpLink);
  
  return GraphQLClient(
    link: link,
    cache: GraphQLCache(),
  );
}
