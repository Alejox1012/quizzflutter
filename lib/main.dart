import 'package:flutter/material.dart';
/* Proyecto Práctico Parte 2.  Ejercisio3. trivia : responde bien las 10 preguntas o
devuelvete al inicio
  Desarrollo de aplicaciones Híbridas
   hecho por:
    -  Didian alejandro valencia ruiz
    -  Harold Rafael Martinez Martinez  */
void main() {
  runApp(MaterialApp(
    home: TriviaApp(),
  ));
}

class TriviaApp extends StatefulWidget {
  @override
  _TriviaAppState createState() => _TriviaAppState();
}

class _TriviaAppState extends State<TriviaApp> {
  int currentQuestion = 0;
  List<Question> questions = [
    Question(
      text: '¿Cuál es el color del cielo?',
      answers: ['Azul', 'Verde', 'Rojo'],
      correctAnswer: 0,
      backgroundColor: Colors.blue,
    ),
    Question(
      text: '¿Cuántos días tiene una semana?',
      answers: ['5', '6', '7'],
      correctAnswer: 2,
      backgroundColor: Colors.green,
    ),
    Question(
      text: '¿Cuál es el planeta más grande del sistema solar?',
      answers: ['Marte', 'Venus', 'Júpiter'],
      correctAnswer: 2,
      backgroundColor: Colors.orange,
    ),
    Question(
      text: '¿Cuál es la capital de Francia?',
      answers: ['Londres', 'Madrid', 'París'],
      correctAnswer: 2,
      backgroundColor: Colors.purple,
    ),
    Question(
      text: '¿Cuántos lados tiene un triángulo?',
      answers: ['4', '5', '3'],
      correctAnswer: 2,
      backgroundColor: Colors.red,
    ),
    Question(
      text: '¿Cuál es el río más largo del mundo?',
      answers: ['Nilo', 'Amazonas', 'Misisipi'],
      correctAnswer: 1,
      backgroundColor: Colors.blue,
    ),
    Question(
      text: '¿En qué año comenzó la Segunda Guerra Mundial?',
      answers: ['1939', '1945', '1918'],
      correctAnswer: 0,
      backgroundColor: Colors.green,
    ),
    Question(
      text: '¿Cuál es el elemento más abundante en la Tierra?',
      answers: ['Hidrógeno', 'Oxígeno', 'Hierro'],
      correctAnswer: 1,
      backgroundColor: Colors.orange,
    ),
    Question(
      text: '¿Cuál es el monte más alto del mundo?',
      answers: ['Monte Everest', 'Monte Kilimanjaro', 'Monte McKinley'],
      correctAnswer: 0,
      backgroundColor: Colors.purple,
    ),
    Question(
      text: '¿En qué país se encuentra la Torre Eiffel?',
      answers: ['Italia', 'España', 'Francia'],
      correctAnswer: 2,
      backgroundColor: Colors.red,
    ),
  ];

  void answerQuestion(int selectedAnswer) {
    if (selectedAnswer == questions[currentQuestion].correctAnswer) {
      if (currentQuestion < questions.length - 1) {
        setState(() {
          currentQuestion++;
        });
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('¡Has completado la trivia!'),
              content: Text('¡Felicidades, has respondido todas las preguntas correctamente!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      currentQuestion = 0;
                    });
                  },
                  child: Text('Reiniciar Trivia'),
                ),
              ],
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Respuesta incorrecta'),
            content: Text('La respuesta es incorrecta. ¡Inténtalo de nuevo!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Aceptar'),
              ),
            ],
          );
        },
      );
      setState(() {
        currentQuestion = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quizzz',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.black,
                padding: EdgeInsets.all(16),
                child: Text(
                  'QuizzzApp',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                color: questions[currentQuestion].backgroundColor,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Pregunta ${currentQuestion + 1}:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      questions[currentQuestion].text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              for (int i = 0; i < 3; i++)
                ElevatedButton(
                  onPressed: () {
                    answerQuestion(i);
                  },
                  child: Text(questions[currentQuestion].answers[i]),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> answers;
  final int correctAnswer;
  final Color backgroundColor;

  Question({
    required this.text,
    required this.answers,
    required this.correctAnswer,
    required this.backgroundColor,
  });
}


