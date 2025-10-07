import 'package:dio/dio.dart';

import 'ApiService.dart';
import 'Post.dart';


class PostRepository {
  final ApiService _apiService = ApiService();

  Future<List<Post>> getPosts() async {
    try {
      final response = await _apiService.dio.get('/posts');
      return (response.data as List).map((e) => Post.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Post> getPost(int id) async {
    final response = await _apiService.dio.get('/posts/$id');
    return Post.fromJson(response.data);
  }

  Future<Post> createPost(Post post) async {
    final response = await _apiService.dio.post('/posts', data: post.toJson());
    return Post.fromJson(response.data);
  }

  Future<Post> updatePost(Post post) async {
    final response = await _apiService.dio.put('/posts/${post.id}', data: post.toJson());
    return Post.fromJson(response.data);
  }

  Future<void> deletePost(int id) async {
    await _apiService.dio.delete('/posts/$id');
  }
}
