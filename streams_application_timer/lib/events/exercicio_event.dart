import 'package:streams_application_timer/events/treino_event.dart';
import '../models/treino.dart';

class ExercicioEvent implements TreinoEvent {
  Treino treino;
  int now;

  ExercicioEvent({required this.treino, required this.now});
}
