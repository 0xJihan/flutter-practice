import 'package:flutter/material.dart';
import 'package:flutter_practice/domain/utils.dart';



class SliverTopBarExample extends StatelessWidget {
  const SliverTopBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true, // stays visible at top when collapsed
            floating: false, // doesn’t reappear when scrolling up
            expandedHeight: 200.0, // height when expanded
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Today’s News", style: TextStyle(fontSize: 18)),
              background: Image.network(
                randomImage,
                fit: BoxFit.cover,
              ),
            ),
          ),


          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=${index + 1}"),
                ),
                title: Text("Article Title #$index"),
                subtitle: Text("This is a short description of article #$index"),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
