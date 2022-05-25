import 'package:finsta/data/models/post.dart';
import 'package:finsta/data/services/post.apiService.dart';

class PostRepository {
  final PostService apiService;
  PostRepository({required this.apiService});

  Future<List<Post>?> getPostsList() async {
    final response = await apiService.getPostsData();
    print(response?.data['posts']);
    final data = response?.data['posts'] as List<dynamic>;
    return data.map((post) => Post.fromMap(post)).toList();
  }
}
