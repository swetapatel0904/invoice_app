import 'package:flutter/material.dart';
import '../../utils/global.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children:[
                const Text("Enter your products details that you bought",style: TextStyle(fontSize: 18),),
                const SizedBox(height: 25,),
                Column(
                  children: List.generate(chocolateList.length, (index) => Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(width: MediaQuery.sizeOf(context).width*0.60,
                              child: TextFormField(decoration: const InputDecoration(hintText: "Name"),)),
                          SizedBox(width: MediaQuery.sizeOf(context).width*0.60,
                              child: TextFormField(decoration: const InputDecoration(hintText: "Price"),)),
                          SizedBox(width: MediaQuery.sizeOf(context).width*0.60,
                              child: TextFormField(decoration: const InputDecoration(hintText: "Quantity"),)),
                          IconButton(onPressed: (){
                            setState(() {
                              chocolateList.removeAt(index);
                            });
                          }, icon: const Icon(Icons.delete))
                        ],
                      )
                    ],
                  )
                  ),






                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    chocolateList.add({"name":"","price":0,"quantity":0,"s1":TextEditingController(),"s2":TextEditingController(),"s3":TextEditingController()},);
                  });
                }, child: const Text("Add")),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  setState(() {
                    for(int j=0;j<chocolateList.length;j++)
                      {
                        chocolateList[j]["name"]=chocolateList[j]["s1"].text;
                        chocolateList[j]["price"]=chocolateList[j]["s2"].text;
                        chocolateList[j]["quantity"]=chocolateList[j]["s3"].text;
                      }
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Data is saved")));
                    Navigator.pushNamed(context, 'bill');
                  });
                }, child: const Text("Submit"))

              ]

            ),
          ),
        ),

      ),
    );


  }
}


