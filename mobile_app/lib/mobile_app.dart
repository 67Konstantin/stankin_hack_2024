import '/exports.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0.0,
      ),
      body: HomeScreen()
    );
  }
}
