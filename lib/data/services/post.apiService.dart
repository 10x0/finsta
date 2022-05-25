import 'package:dio2/dio2.dart';
import 'package:finsta/configs/constants.dart';

class PostService {
  final Dio _dio = Dio();

  Future<Response?> getPostsData() async {
    try {
      final Response response = await _dio
          .get('${ApiServiceConstants.baseURL}/${ApiServiceConstants.posts}');
      return response;
    } catch (error) {
      print('Error');
    }
  }
}
