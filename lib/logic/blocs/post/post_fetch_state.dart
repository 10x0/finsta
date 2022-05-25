part of 'post_fetch_cubit.dart';

@immutable
abstract class PostFetchState {}

class PostFetchInitial extends PostFetchState {}

class PostFetchLoading extends PostFetchState {}

class PostFetchLoaded extends PostFetchState {
  final List<Post> postsList;

  PostFetchLoaded({required this.postsList});

  List<Object> get props => [postsList];
}

class PostFetchError extends PostFetchState {
  final Failure failure;

  PostFetchError({required this.failure});
}
