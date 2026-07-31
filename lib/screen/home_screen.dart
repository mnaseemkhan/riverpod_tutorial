import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter_tutorial/screen/counter_screen.dart';

final hello = Provider<String>((ref){
  return 'Hello World';
});

final age = Provider<int>((ref){
  return 27;

});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final value = ref.watch(hello);
    final value2 = ref.watch(age);
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$value' + ' $value2 '),
            SizedBox(height: 100,),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context)=> CounterScreen()
                  ));
            }, child: Text('Next'))
          ],
        ),
      ),
    );
  }
}


// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final value = ref.watch(hello);
//     final value2 = ref.watch(age);
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text(''),
//       ),
//       body: Center(
//         child: Text('$value' + '$value2 '),
//       ),
//     );
//   }
// }
