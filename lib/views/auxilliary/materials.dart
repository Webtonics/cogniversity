import 'package:cogniversity/views/teacher/inner/add_material.dart';
import 'package:cogniversity/widgets/global/spacer.dart';
import 'package:cogniversity/widgets/my_action_button.dart';
import 'package:flutter/material.dart';

class MaterialsView extends StatelessWidget {
  const MaterialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Materials"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.topRight,
              child: const MyActionButton(page: AddMaterial(), icon: Icons.add, title: "Add Material"),
            ),
            const MySpacer(height: 10,),
            Expanded(
              child: ListView.builder(itemCount: 5,itemBuilder: ((context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.picture_as_pdf_sharp),
                    title: const Text("VTE 101 NOTE.PPT"),
                    trailing: IconButton(onPressed: (){
                      //Download material
                    }, icon: const Icon(Icons.download)),
                  ),
                );
              })),
            )
          ],
        ),
      ),
    );
  }
}