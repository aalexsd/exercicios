import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:streams_application_timer/events/exercicio_event.dart';

class Countdown extends StatelessWidget {
  final ExercicioEvent event;
  const Countdown({super.key, required this.event});

  getColor(int now, int limit) {
    double factor = now / limit;
    if (factor > 0.2) {
      return Colors.cyan;
    } else if (factor > 0.1 && factor <= 0.2) {
      return Colors.yellow[400];
    } else {
      return Colors.red[400];
    }
  }

  @override
  Widget build(BuildContext context) {
    final treino = event.treino;
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 350,
          height: 350,
          child: CircularProgressIndicator(
            value: 1 - (event.now / treino.seconds),
            strokeWidth: 15,
            backgroundColor: Colors.grey.shade300,
            color: getColor(event.now, treino.seconds),
          ),
        ),
        Text(
          event.now.toString(),
          style: TextStyle(fontSize: 70),
        ),
        Positioned(
          bottom: 60,
          child: Text(
            event.treino.name.toString(),
            style: TextStyle(fontSize: 45),
          ),
        )
      ],
    );
  }
}
