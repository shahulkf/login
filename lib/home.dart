import 'package:flutter/material.dart';
import 'package:flutter_sample/Login.dart';
import 'package:flutter_sample/show.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
          child: ListView.separated(
        itemBuilder: (ctx, index) {
          return ListTile(
            title:
            // index % 2 ==0?
            //  Text('Person $index',
            //  style: TextStyle(color: Colors.green),):
             Text('Person $index'),
            
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return ShowPage(name: 'person$index');
                
              }));
            },
            subtitle: Text('message $index'),
            leading: index % 2 == 0
                ? const CircleAvatar(
                  
                    radius: 30,
                    backgroundColor: Color.fromARGB(255, 144, 92, 153),
                    backgroundImage: NetworkImage(
                        'https://c8.alamy.com/comp/2GM62CM/big-group-of-people-faces-together-making-love-heart-shape-diverse-friend-team-concept-community-support-or-social-care-cartoon-on-isolated-backgrou-2GM62CM.jpg'),
                  )
                : SizedBox(
                    width: 60,
                    child: Image.network(
                        'https://img.freepik.com/free-vector/african-male-female-character-wearing-casual-clothes-different-hairstyles-gathered-black-people-crowd-demanding-equal-rights-every-person-flat-vector-illustration-black-community-concept_74855-22098.jpg'),
                  ),
             trailing: 
            //index % 2 == 0 ?
            // Text('active',style:TextStyle(color: Colors.green) ,):
            // Text('offline',style: TextStyle(color: Colors.red),)
            const Icon(
              Icons.message,
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return const Divider();
        },
        itemCount: 10,
      )),
    );
  }

  signout(BuildContext ctx) async {
    showDialog(context: (ctx), builder: ((context) => AlertDialog(
      title: Text('Are you sure want to Logout !'),
      actions: [
        ElevatedButton(onPressed: (){
          Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => Loginscreen()), (route) => false);
        }, child: Text('Yes')),
        ElevatedButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text('No')),
      ],
    )));
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.remove('Logged');
     
  }
}
