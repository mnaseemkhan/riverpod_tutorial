import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter_tutorial/provider/search_provider.dart';
import 'package:riverpod_flutter_tutorial/screen/like_screen.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Screen'),),
      body: Column(
        children: [
          TextField(
            onChanged: (value){
              ref.read(searchProvider.notifier).search(value);
            },
          ),
          Consumer(builder: (context, ref, child){
            final search = ref.watch(searchProvider);

            return Text(search);
          }),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> LikeScreen()));
          },
              child: Text('Next'))
        ],
      ),
    );
  }
}
