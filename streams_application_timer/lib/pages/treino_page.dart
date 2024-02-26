import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:streams_application_timer/controller/treino_controller.dart';
import 'package:streams_application_timer/events/end_event.dart';
import 'package:streams_application_timer/events/exercicio_event.dart';
import 'package:streams_application_timer/events/start_event.dart';
import 'package:streams_application_timer/events/treino_event.dart';
import 'package:streams_application_timer/models/treino.dart';
import 'package:streams_application_timer/widgets/countdown_widget.dart';

class TreinoPage extends StatefulWidget {
  const TreinoPage({super.key});

  @override
  State<TreinoPage> createState() => _TreinoPageState();
}

class _TreinoPageState extends State<TreinoPage> {
  bool showButton = true;
  late final TreinoController controller;
  late final Stream<TreinoEvent> treinoStream;

  start() {
    controller = TreinoController(treinos: [
      Treino(seconds: 5, name: 'Abdominais'),
      Treino(seconds: 1, name: 'Descanso'),
      Treino(seconds: 5, name: 'Prancha'),
    ]);
    setState(() {
      treinoStream = controller.start();
      showButton = false;
    });
  }

  restart() {
    setState(() {
      showButton = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: showButton
              ? ElevatedButton(
                  onPressed: () {
                    start();
                  },
                  child: Text('Iniciar Treino'),
                )
              : StreamBuilder(
                  stream: treinoStream,
                  builder: (context, AsyncSnapshot<TreinoEvent> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      print('acabou');
                      print(showButton);
                      showButton = true;
                      print(showButton);
                    
                    }
                    TreinoEvent? event = snapshot.data;
                    if (snapshot.hasError) {
                      return Text('Erro ao carregar o treino.');
                    } else if (event is StartEvent) {
                      return Text('Iniciando treino.');
                    } else if (event is EndEvent) {
                      return Text('Finalizando treino.');
                    } else if (event is ExercicioEvent) {
                      return Countdown(event: event);
                    }
                    return Container();
                  },
                )),
    );
  }
}
