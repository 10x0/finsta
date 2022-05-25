import 'package:finsta/configs/constants.dart';
import 'package:finsta/data/models/post.dart';
import 'package:finsta/logic/blocs/post/post_fetch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _currentIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo.png',
          width: 100,
          color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        ),
        actions: [
          SvgPicture.asset(
            'assets/svgs/heart-outline.svg',
            width: 28,
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
          const SizedBox(width: 16),
          SvgPicture.asset(
            'assets/svgs/messenger-outline.svg',
            width: 28,
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
          const SizedBox(width: 16),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          enableFeedback: false,
          currentIndex: _currentIndex,
          onTap: (value) => setState(() {
                _currentIndex = value;
              }),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              activeIcon: SvgPicture.asset(
                'assets/svgs/home-bold.svg',
                width: 28,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
              icon: SvgPicture.asset(
                'assets/svgs/home-outline.svg',
                width: 28,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              activeIcon: SvgPicture.asset(
                'assets/svgs/search-bold.svg',
                width: 28,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
              icon: SvgPicture.asset(
                'assets/svgs/search-outline.svg',
                width: 28,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Add Post',
              icon: SvgPicture.asset(
                'assets/svgs/add-outline.svg',
                width: 28,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Home',
              activeIcon: SvgPicture.asset(
                'assets/svgs/bag-bold.svg',
                width: 28,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
              icon: SvgPicture.asset(
                'assets/svgs/bag-outline.svg',
                width: 28,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              activeIcon: CircleAvatar(
                radius: 16,
                backgroundColor: Theme.of(context).textTheme.bodyText2?.color,
                child: const CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.blue,
                ),
              ),
              icon: const CircleAvatar(
                radius: 14,
                backgroundColor: Colors.blue,
              ),
            )
          ]),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<PostFetchCubit, PostFetchState>(
            builder: (context, state) {
          if (state is PostFetchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostFetchError) {
            return Text(state.failure.message);
          } else if (state is PostFetchLoaded) {
            final postsList = state.postsList;
            return postsList.isEmpty
                ? const Center(child: Text('No posts found.'))
                : ListView.builder(
                    itemCount: postsList.length,
                    itemBuilder: (context, index) =>
                        PostCard(post: postsList[index]),
                  );
          }
          return const Text('');
        }),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                const CircleAvatar(backgroundColor: Colors.deepPurpleAccent),
                const SizedBox(width: 8),
                Text(
                  post.user.username,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const Icon(Icons.more_vert)
          ]),
        ),
        Container(
          height: 400,
          decoration: const BoxDecoration(
            color: Colors.blue,
            // image: DecorationImage(
            //     image:
            //         NetworkImage('${ApiServiceConstants.baseURL}${post.file}')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/heart-outline.svg',
                    height: 32.0,
                    color: Theme.of(context).textTheme.bodyText2?.color,
                  ),
                  const SizedBox(width: 12.0),
                  SvgPicture.asset(
                    'assets/svgs/comment-outline.svg',
                    height: 32.0,
                    color: Theme.of(context).textTheme.bodyText2?.color,
                  ),
                  const SizedBox(width: 12.0),
                  SvgPicture.asset(
                    'assets/svgs/send-outline.svg',
                    height: 32.0,
                    color: Theme.of(context).textTheme.bodyText2?.color,
                  ),
                ],
              ),
              SvgPicture.asset(
                'assets/svgs/saved-outline.svg',
                height: 32.0,
                color: Theme.of(context).textTheme.bodyText2?.color,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${post.likesCount} likes'),
              Row(
                children: [
                  Text(
                    "${post.user.username} ",
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    post.description,
                  )
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
