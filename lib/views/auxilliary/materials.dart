import 'package:flutter/material.dart';

class MaterialsView extends StatelessWidget {
  const MaterialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Materials"),
      ),
      body: Column(
        children: [
          ListView.builder(itemBuilder: ((context, index) {
            return ListTile(
              leading: Icon(Icons.picture_as_pdf_sharp),
              title: const Text("VTE 101 NOTE.PPT"),
              trailing: IconButton(onPressed: (){
                //Download material
              }, icon: const Icon(Icons.download)),
            );
          }))
        ],
      ),
    );
  }
}