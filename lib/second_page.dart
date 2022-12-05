import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:atividade02/pessoa.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.values}) : super(key: key);
  
  final List<Pessoa> values;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registros'),
      ),
      body: ListView.builder(
        itemCount: values.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              calcImc(context, values[index].nome, values[index].peso,values[index].altura);
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                title: Text(values[index].nome),
                subtitle: Text("${values[index].peso}kg\n${values[index].altura}m"),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: Colors.deepPurple,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
            ),
            ),
          );
        },
        ),
      );
  }

}

calcImc(context,nome, peso, altura) {
  var imc = peso / (altura * altura);
  var imcFixed = imc.toStringAsFixed(2);
  String imcText;

  if (imc < 18.5) {
    imcText = "Abaixo do peso";
  } 
  else if (imc > 25.0) {
    imcText = "Acima do peso";
  } else {
    imcText = "Peso ideal";
  }

  ImcDialog(context, nome, peso, altura, imcFixed, imcText);
}

ImcDialog(context,nome,peso,altura,imcFixed,imcText) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              //border: Border.all(width: 3, color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0,05),
                  blurRadius: 15
                ),
              ]
            ),
            padding: const EdgeInsets.all(15),
            width: 300,
            height: 300,
            child: Column(
              children: [
                Text(
                  nome,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${peso}Kg",
                  style: const TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 53, 53, 53),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${altura}m",
                  style: const TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 53, 53, 53),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  imcFixed + " IMC",
                  style: const TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 53, 53, 53),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  imcText,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 53, 53, 53),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok')
                  )
              ],
            )
          ),
        )
      );
    }
  );
}