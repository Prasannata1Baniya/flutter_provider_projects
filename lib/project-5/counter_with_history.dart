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
        ),
        body: Consumer<CounterHistoryProvider>(builder: (ctx, counter, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Current Value: ${counter.count}',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),

                // Increment Button
                button("Increment", () {
                  ctx.read<CounterHistoryProvider>().increment();
                }),
                const SizedBox(height: 20),
                historySection(
                  title: "Increment History",
                  history: counter.incrementHistory,
                ),

                // Decrement Button
                button("Decrement", () {
                  ctx.read<CounterHistoryProvider>().decrement();
                }),
                const SizedBox(height: 20),
                historySection(
                  title: "Decrement History",
                  history: counter.decrementHistory,
                ),

                // Reset Button
                button("Reset", () {
                  ctx.read<CounterHistoryProvider>().reset();
                }),
                const SizedBox(height: 20),
                historySection(
                  title: "Reset History",
                  history: counter.resetHistory,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // Reusable Button Widget
  GestureDetector button(String txt, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          txt,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  // Reusable History Section Widget
  Widget historySection({required String title, required List<int> history}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: history.isNotEmpty ? 150 : 30, // Adjust height dynamically
          child: history.isNotEmpty
              ? ListView.builder(
            shrinkWrap: true,
            itemCount: history.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.history),
                title: Text("Value: ${history[index]}"),
              );
            },
          )
              : const Center(
            child: Text(
              "No history available",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}