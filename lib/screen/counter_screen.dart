import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_flutter_tutorial/screen/color_screen.dart';


final counter = StateProvider<int>((ref){
  return 0;
});

final switchBox = StateProvider<bool>((ref){
  return false;
});

class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    print('build1');

    return Scaffold(
      appBar: AppBar(title: Text('Counter'),centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
              builder: (context, ref, child){
                final count = ref.watch(counter);
                print('build2');
                return Text('$count', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30));

              }),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                ref.read(counter.notifier).state == 0 ? null :
                ref.read(counter.notifier).state--;
              }, child: Text('-')),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: (){
                ref.read(counter.notifier).state++;
              }, child: Text('+')),
            ],
          ),
          SizedBox(height: 70,),
          Text('Switch',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
          SizedBox(height: 20,),
          Consumer(builder: (context, ref, child){
            final box = ref.watch(switchBox);
            return Switch(value: box, onChanged: (value){
              ref.read(switchBox.notifier).state =value;
            });
          }),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context)=>
            ColorScreen()));
          }, child: Text('Next'))
        ],
      ),
    );
  }
}
