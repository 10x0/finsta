import 'package:finsta/configs/constants.dart';
import 'package:finsta/configs/routes.dart';
import 'package:finsta/configs/themes.dart';
import 'package:finsta/data/repos/post.repo.dart';
import 'package:finsta/data/services/post.apiService.dart';
import 'package:finsta/logic/blocs/post/post_fetch_cubit.dart';
import 'package:finsta/presentation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    postService: PostService(),
  ));
}

class MyApp extends StatelessWidget {
  final PostService postService;
  const MyApp({super.key, required this.postService});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostFetchCubit(
            postsRepository: PostRepository(apiService: postService),
          )..fetchAllPosts(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Finsta',
        theme: Themes.light(context),
        darkTheme: Themes.dark(context),
        home: const LoginScreen(),
        onGenerateRoute: generateRoutes,
        navigatorKey: Navigation.key,
      ),
    );
  }
}
