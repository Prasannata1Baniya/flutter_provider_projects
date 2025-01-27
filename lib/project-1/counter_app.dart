import 'package:flutter/material.dart';
import 'package:flutter_provider/project-1/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          title:const Text("Counter App"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
           child: Text("${Provider.of<CounterProvider>(context,listen: true).getCount()}",
           style:const TextStyle(fontSize:40)),
        ),
        floatingActionButton:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: (){
                Provider.of<CounterProvider>(context,listen: false).increment();
              },
            child:const Icon(Icons.add),),
            FloatingActionButton(
              onPressed: (){
                Provider.of<CounterProvider>(context,listen: false).decrement();
              },
              child:const Icon(Icons.remove),),
          ],
        ) ,
      ),
    );

  }
}
