import 'package:graphql_flutter/graphql_flutter.dart';
import 'graphql_client.dart';

class PostService {
  static const String getAllPostsQuery = """
    query Getallposts {
      getallposts {
        id
        contenttype
        title
        media
        mediadescription
        createdat
        amountlikes
        amountviews
        amountcomments
        isliked
        isviewed
        isreported
        isdisliked
        issaved
        user {
          id
          username
          img
          isfollowed
        }
      }
    }
  """;

  Future<QueryResult> fetchAllPosts() async {
    GraphQLClient client = GraphQLConfig.clientToQuery();
    QueryOptions options = QueryOptions(
      document: gql(getAllPostsQuery),
    );
    
    final result = await client.query(options);

    if (result.hasException) {
      print(result.exception.toString());
    }

    return result;
  }
}
