import 'package:flutter/material.dart';
import 'package:flutter_provider/project-4/stop_watch_provider.dart';
import 'package:provider/provider.dart';

class StopwatchScreen extends StatelessWidget {
  const StopwatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stopwatch = Provider.of<StopwatchProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatDuration(stopwatch.elapsedTime),
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: stopwatch.isRunning ? null : stopwatch.start,
                  child: const Text('Start'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: stopwatch.isRunning ? stopwatch.stop : null,
                  child: const Text('Stop'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: stopwatch.reset,
                  child:const  Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String formatDuration(int seconds) {
    final minutes = (seconds ~/ 60) % 60;
    final hours = seconds ~/ 3600;
    final displaySeconds = seconds % 60;

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${displaySeconds.toString().padLeft(2, '0')}';
  }
}