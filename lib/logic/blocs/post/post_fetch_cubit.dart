import 'package:bloc/bloc.dart';
import 'package:finsta/data/models/failure.dart';
import 'package:finsta/data/models/post.dart';
import 'package:finsta/data/repos/post.repo.dart';
import 'package:meta/meta.dart';

part 'post_fetch_state.dart';

class PostFetchCubit extends Cubit<PostFetchState> {
  final PostRepository postsRepository;
  PostFetchCubit({required this.postsRepository}) : super(PostFetchInitial());

  Future<void> fetchAllPosts() async {
    emit(PostFetchLoading());
    try {
      final List<Post>? postsList = await postsRepository.getPostsList();
      emit(PostFetchLoaded(postsList: postsList ?? []));
    } on Failure catch (error) {
      emit(PostFetchError(failure: error));
    } catch (error) {
      print('Error : $error');
    }
  }
}
