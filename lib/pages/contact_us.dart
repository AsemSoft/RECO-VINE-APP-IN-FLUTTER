import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smart_test/service/utils.dart';
import 'package:smart_test/widgets/drawer.dart';

import 'main_page.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ));
            },
            icon: Icon(Icons.home),
          ),
        ],
        title: Text("Contact Us"),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.facebook,
                  ),
                  iconSize: 60,
                  color: Colors.blue,
                  splashColor: Colors.blue,
                  onPressed: () => Utils.openLink(
                      url: 'https://www.facebook.com/evil4ever.Hisoka/'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.twitter,
                  ),
                  iconSize: 60,
                  color: Colors.blue,
                  splashColor: Colors.blue,
                  onPressed: () =>
                      Utils.openLink(url: 'https://twitter.com/MARMOUD04YASSIN'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.whatsapp,
                  ),
                  iconSize: 60,
                  color: Colors.green,
                  splashColor: Colors.green,
                  onPressed: () => Utils.openLink(url: 'https://wa.link/nty5f9'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.chrome,
                  ),
                  iconSize: 60,
                  color: Colors.orange,
                  splashColor: Colors.orange,
                  onPressed: () => Utils.openLink(
                      url: 'https://github.com/Evil4eveR/RicoVineApp'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.mailBulk,
                  ),
                  iconSize: 60,
                  color: Colors.red,
                  splashColor: Colors.red,
                  onPressed: () => Utils.openEmail(
                    toEmail: "example@gmail.com",
                    subject: "Hello",
                    body: "Write Your Email Message",
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
