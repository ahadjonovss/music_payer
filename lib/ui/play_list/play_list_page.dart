import 'package:flutter/material.dart';
import 'package:music_payer/ui/play_list/widgets/music_item.dart';

class PlayListPage extends StatefulWidget {
  const PlayListPage({Key? key}) : super(key: key);

  @override
  State<PlayListPage> createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Play List"),),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: ReorderableListView.builder(
          physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return MusicItem(key: UniqueKey(),);
            },
            itemCount: 15,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                // final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
                // final user = users.removeAt(oldIndex);
                // users.insert(index, user);
              });
            },),
      ),
    );
  }
}
