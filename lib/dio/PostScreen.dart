import 'package:flutter/material.dart';

import 'Post.dart';
import 'PostRepository.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final PostRepository _repo = PostRepository();
  late Future<List<Post>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = _repo.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dio CRUD Example")),
      body: FutureBuilder<List<Post>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) return Center(child: Text(snapshot.error.toString()));

          final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final p = posts[index];
              return ListTile(
                title: Text(p.title),
                subtitle: Text(p.body),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await _repo.deletePost(p.id!);
                    setState(() => _posts = _repo.getPosts());
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newPost = Post(userId: 1, title: 'New Post', body: 'This is a new post');
          await _repo.createPost(newPost);
          setState(() => _posts = _repo.getPosts());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
