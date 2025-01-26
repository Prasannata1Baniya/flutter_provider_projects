import 'package:flutter/material.dart';
import 'package:flutter_provider/project-5/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterAppWithHistory extends StatelessWidget {
  const CounterAppWithHistory({super.key});

  @override
  Widget build(BuildContext context) {
    //final counterProvider=Provider.of<CounterHistoryProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Counter with History"),
          centerTitle: true,
        ),
        body: Consumer<CounterHistoryProvider>(builder: (ctx, counter, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${counter.count}'),

              const SizedBox(height: 40),
              //Increment
              button("Increment", () {
                ctx.read<CounterHistoryProvider>().increment();
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("current value:${counter.count}"),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                        itemCount: counter.incrementHistory.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                "history:${counter.incrementHistory[index]}"),
                          );
                        }),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              //Decrement
              button("Decrement", () {
                ctx.read<CounterHistoryProvider>().decrement();
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("current value:${counter.count}"),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: counter.decrementHistory.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                "history:${counter.decrementHistory[index]} "),
                          );
                        }),
                  ),
                ],
              ),

              const SizedBox(height:20),
              //Reset
              button("Reset", () {
                ctx.read<CounterHistoryProvider>().reset();
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("current value:${counter.count}"),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: counter.resetHistory.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title:
                                Text("history:${counter.resetHistory[index]} "),
                          );
                        }),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  GestureDetector button(String txt, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          txt,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
