import 'package:flutter_clean_instagram/app/data/provider/post_api.dart';

class PostRepository {
  final PostApi clientApi;
  const PostRepository({this.clientApi}) : assert(clientApi != null);

  getMyPosts(String uid) {
    return clientApi.getMyPosts(uid);
  }
}
