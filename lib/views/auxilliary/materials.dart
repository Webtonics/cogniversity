import 'package:cogniversity/providers/role_provider.dart';
import 'package:cogniversity/views/teacher/inner/add_material.dart';
import 'package:cogniversity/widgets/global/spacer.dart';
import 'package:cogniversity/widgets/my_action_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MaterialsView extends StatelessWidget {
  const MaterialsView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEducator = context.watch<RoleProvider>().isEducator;
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
              child: isEducator? const MyActionButton(page: AddMaterial(), icon: Icons.add, title: "Add Material"): Container(),
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
                    }, icon: isEducator ? const Icon(Icons.delete)
                    :const Icon(Icons.download)),
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