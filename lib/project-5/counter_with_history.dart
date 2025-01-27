import 'package:flutter/material.dart';
import 'package:flutter_provider/project-5/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterAppWithHistory extends StatelessWidget {
  const CounterAppWithHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Counter with History"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Display current count
          Consumer<CounterHistoryProvider>(
            builder: (context, counter, child) {
              return Text(
                'Current Count: ${counter.count}',
                style:const TextStyle(fontSize: 40),
              );
            },
          ),
          const SizedBox(height: 20),

          // Buttons to increment, decrement, and reset counter
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  context.read<CounterHistoryProvider>().increment();
                },
              ),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  context.read<CounterHistoryProvider>().decrement();
                },
              ),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  context.read<CounterHistoryProvider>().reset();
                },
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Display history
          Expanded(
            child: Consumer<CounterHistoryProvider>(
              builder: (context, counter, child) {
                return ListView.builder(
                  itemCount: counter.history.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('History: ${counter.history[index]}'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    ),
    ),
    );
  }
}