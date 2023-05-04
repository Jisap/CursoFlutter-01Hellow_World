//impm
import 'package:flutter/material.dart';

//stles
class CounterFunctionsScreen extends StatefulWidget {
  // Widget CounterScreen que extiende de StatefulWidget
  const CounterFunctionsScreen({Key? key}) : super(key: key);

  @override // Sobreescribimos el método createState de la superclase StatefulWidget
  State<CounterFunctionsScreen> createState() =>
      _CounterFunctionsScreenState(); // State<CounterScreen> indica que createState devuelve una instancia de clase State
} // correspondiente a CounterScreen

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  // Instanciamos la clase estado y le damos la lógica del widget

  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Center(child: Text('Counter Functions Screen')),
        actions: [
          IconButton(
            icon: const Icon( Icons.refresh_rounded ), 
            onPressed: () { 
              setState((){
                clickCounter = 0;
              });
          })
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter',
                style: const TextStyle(
                    fontSize: 160, fontWeight: FontWeight.w100)),
            Text(clickCounter == 1 ? 'Click' : 'Clicks',
                style: const TextStyle(fontSize: 25))
          ],
        ),
      ),


      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children:[

          CustomButton(
            icon: Icons.refresh_rounded,
            onPressed: (){
              setState((){
                clickCounter=0;
              });
            }
          ),

          const SizedBox(height: 10),

          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: (){
              if(clickCounter == 0) return;
              setState((){
                clickCounter--;
              });
            },  
          ),

          const SizedBox( height: 10 ),

          CustomButton( 
            icon: Icons.plus_one,
            onPressed: (){
              setState(() {
                clickCounter++;
              });
            },  
          ),
        ]
      )
    );
  }
}

class CustomButton extends StatelessWidget {
  
  final IconData icon;
  final VoidCallback? onPressed;
  
  const CustomButton({
    super.key, 
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
    shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
