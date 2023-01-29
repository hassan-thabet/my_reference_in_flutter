import 'package:flutter/material.dart';
import 'package:my_reference_in_flutter/modules/login_screen_with_video_background.dart';
import 'package:my_reference_in_flutter/modules/progress_with_percentage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my reference in flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('my reference in flutter'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text(
                  'Progress With Percentage',
              ),
              tileColor: Colors.white,
              leading: const Icon(Icons.arrow_forward_ios_outlined),
              trailing: const CircularProgressIndicator(strokeWidth: 2,),
              onTap: ()
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProgressWithPercentage()
                    )
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text(
                'Login Screen with video Background',
              ),
              tileColor: Colors.white,
              leading: const Icon(Icons.arrow_forward_ios_outlined),
              trailing: const Icon(Icons.video_call_outlined , size: 38, color: Colors.blue,),
              onTap: ()
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreenWithVideoBackground()
                    )
                );
              },
            ),
          ),

        ],
      )
    );
  }
}
