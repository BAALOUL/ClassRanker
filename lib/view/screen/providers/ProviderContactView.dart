// ignore_for_file: unnecessary_string_escapes
import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/view/widgets/sections/firstRowBackArrow.dart';
import 'package:flutter/material.dart';
import '../../widgets/titleCustomBig.dart';

class ProviderContactView extends StatelessWidget {
  //final List<Review> reviewList;
  const ProviderContactView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const FirstRowBackArrow(),
          backgroundColor: ConsColors.blueWhite,
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                color: ConsColors.blueWhite,
                height: 150,
                child: const TitleCustomBig(
                  title: "Provider Contacts",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(top: 60),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text('Phone'),
                    subtitle: const Text('123-456-7890'),
                    onTap: () {
                      // Handle phone contact tap
                      // Example: launch phone dialer with the number
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text('Email'),
                    subtitle: const Text('example@example.com'),
                    onTap: () {
                      // Handle email contact tap
                      // Example: launch email client with the email address
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text('Address'),
                    subtitle: const Text('123 Main St, City, Country'),
                    onTap: () {
                      // Handle address contact tap
                      // Example: open maps with the address location
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Website'),
                    subtitle: const Text('www.example.com'),
                    onTap: () {
                      // launch('https://www.example.com'); // Open website URL
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                        Icons.language), // Replace with your WhatsApp icon
                    title: const Text('WhatsApp'),
                    subtitle: const Text('123-456-7890'),
                    onTap: () {
                      //launch('https://wa.me/1234567890'); // Open WhatsApp chat
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
