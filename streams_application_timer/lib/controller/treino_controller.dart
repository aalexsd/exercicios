import 'package:streams_application_timer/events/end_event.dart';
import 'package:streams_application_timer/events/exercicio_event.dart';
import 'package:streams_application_timer/events/start_event.dart';
import 'package:streams_application_timer/events/treino_event.dart';
import 'package:streams_application_timer/models/treino.dart';

class TreinoController {
  List<Treino> treinos;

  TreinoController({required this.treinos});

  Stream<TreinoEvent> start() async* {
    yield StartEvent();

    for (Treino treino in treinos) {
      for (int seconds = treino.seconds; seconds >= 0; seconds--) {
        await Future.delayed(const Duration(seconds: 1));
        yield ExercicioEvent(treino: treino, now: seconds);
      }
    }

    yield EndEvent();
  }
}
