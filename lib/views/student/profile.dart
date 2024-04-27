// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cogniversity/Services/authservice/user_services.dart';
import 'package:cogniversity/main.dart';
// import 'package:cogniversity/main.dart';
import 'package:cogniversity/models/user_model.dart';
// import 'package:cogniversity/providers/role_provider.dart';
import 'package:cogniversity/providers/user_provider.dart';
// import 'package:cogniversity/views/student/studentapp.dart';
// import 'package:cogniversity/views/teacher/teacherapp.dart';
import 'package:cogniversity/widgets/elevated_buttons.dart';
import 'package:cogniversity/widgets/global/spacer.dart';
import 'package:cogniversity/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool updateuser = true;

  // late Future<void> _init;
  @override
  void initState() {
    _emailController = TextEditingController();
    _usernameController = TextEditingController();
    super.initState();
  }

  // updateUser() async {
  //   // bool updateuser = true;

  //   await AuthService()
  //       .updateUserInfo(_emailController.text, _usernameController.text);

  //   // setState(() {
  //   //   updateuser = false;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<UserProvider>().getUser;
    if (user != null) {
      return Scaffold(
        // backgroundColor: scaffoldColor,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            "Profile",
            style:Theme.of(context).textTheme.titleLarge
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 CircleAvatar(
                  radius: 60,

                  
                  // profile image
                  backgroundImage: NetworkImage(user.photoURL),
                  // backgroundImage: CachedNetworkImageProvider("https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fHww")
                  ),
                //username
              
                const MySpacer(height: 7,),
                Expanded(
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Column(
                      children: [
                        MyTextField(
                          controller: _usernameController,
                          label: "Change Username",

                          hinttext: user.displayName,
                          
                          keyboardtype: TextInputType.text,
                          enabled: updateuser,
                        ),
                        //email
                        const MySpacer(height: 7,),
                        MyTextField(
                          controller: _emailController,
                          label: "Change Email Address",
                          // label: "",

                          // hinttext: user.email,
                          hinttext: user.email,
                          keyboardtype: TextInputType.emailAddress,
                          enabled: updateuser,
                        ),
                        const MySpacer(height: 11,),

                        //Button
                        GestureDetector(
                          onTap: () => setState(() {
                            updateuser = !updateuser;
                          }),
                          child: MyElevattedButton(
                              title: updateuser
                                  ? "Update Settings"
                                  : "Change Setting",
                              // action: updateUser
                              action: (){},
                              ),
                        ),
                      ],
                    ),
                  ),
                ),

                MySpacer(height: 7,),
                // MyElevattedButton(title: "Login as Educator", action: (){
                //   context.read<RoleProvider>().setRoleAsEducator();
                //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => const TeacherApp( tab: 0,) )));
                // }),

                const MySpacer(height: 7,),
                IconButton(
                    onPressed: () {
                      AuthService().signout();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: ((context) => const Authuser())));
                    },
                    icon: const Icon(Icons.logout))
              ],
            ),
          ),
        ),
      );
    } 
    else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
