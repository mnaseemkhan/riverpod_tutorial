import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/like_provider.dart';

class LikeScreen extends ConsumerWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final like = ref.watch(likeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Like Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text('Change the Color of the heart', style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 20
            ),),
          ),
          SizedBox(height: 30,),
          IconButton(onPressed: (){
            ref.read(likeProvider.notifier).state = !like;
          }, icon: Icon(CupertinoIcons.heart_fill,size: 50,
          color: like ?Colors.red : Colors.grey))
        ],
      ),
    );
  }
}
