
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main(){
  runApp(ChangeNotifierProvider(create: (_)=>CounterController(),
child: MaterialApp(
  home: Scaffold(
    body: CounterScreen(),
  ),
),
  ),

  );
}



class CounterController extends ChangeNotifier{
   int number = 0;


  void increament(){
    number++;
    notifyListeners();
  }


}





class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {



    return Center(
      child: Column(
        children: [
          Hero(
            tag: "counter",
            child: Text(context.watch<CounterController>().number.toString(),
            style: TextStyle(
              fontSize: 18
            ),
            ),
          ),

          SizedBox(height: 15),
          IconButton(onPressed: context.read<CounterController>().increament, icon: Icon(Icons.add),),
          SizedBox(height: 15),
          IconButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ReceiverScreen())), icon: Icon(Icons.navigate_next)),
        ],
      ),
    );
  }
}


class ReceiverScreen extends StatelessWidget {
  const ReceiverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Receiver Screen",
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back))
        ],
      ),
      body: Center(
        child: Hero(
            tag: "counter",
            child: Text(context.read<CounterController>().number.toString(),
            style: TextStyle(
              fontSize: 36,
              color: Colors.blue
            ),
            )),
      ),
    );
  }
}

