import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      title: 'Business Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor:const Color.fromARGB(255, 0, 3, 177),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home:const BusinessCard()
      );
  }
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});
  void _launchEmail() async{
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'espinoferdauz@gmail.com',
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  void _launchPhone() async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: '+63 927 760 5966',
    );
    if (await canLaunchUrl(phoneLaunchUri)) {
      await launchUrl(phoneLaunchUri);
    }
  }
  void _launchFacebook() async {
    final Uri fblaunchUri = Uri(
      scheme: 'fb',
      path: 'https://www.facebook.com/ferdauz.espino',
    );
    if (await canLaunchUrl(fblaunchUri)) {
      await launchUrl(fblaunchUri);
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Now update our container width
    width: screenWidth > 600 ? 600 : screenWidth * 0.9;

    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Center(
        child: Card(
          elevation:4,
          child:Container(
            width: 400,
            padding: const EdgeInsets.all(20),
            child:Column(
              mainAxisSize: MainAxisSize.min,
              children:[
                Container(
                  width:120,
                  height:120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,

                    image: DecorationImage(
                      image:NetworkImage("https://github.com/FERDAUZ-ESPINO/PWA-Flutter-Web-App/blob/master/images/profile.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(height:20),
              const Text(
                'Ferdauz Espino',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Data Analyst',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const Divider (height: 32, thickness: 1),
              ListTile(
                leading: Icon(Icons.email, color: Colors.teal),
                title: Text('espinoferdauz@gmail.com'),
                onTap: _launchEmail,
                  hoverColor: Colors.teal.withOpacity(0.1),
              ),
              ListTile(
                leading: Icon(Icons.phone, color: Colors.teal),
                title: Text('+63 927 760 5966'),
                onTap: _launchPhone,
                  hoverColor: Colors.teal.withOpacity(0.1),
              ),
              ListTile(
                leading: Icon(Icons.facebook_outlined, color: Colors.teal),
                title: Text("Ferdauz G. Espino"),
                onTap: _launchFacebook,
                  hoverColor: Colors.teal.withOpacity(0.1),
              ),
              const  ListTile(
                leading: Icon(Icons.location_on, color: Colors.teal),
                title: Text('Roxas Avenue, Davao City, Philippines'),
              ),
              ]
            )
          )
        )
      )
    );
  }
}