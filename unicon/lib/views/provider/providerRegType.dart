import 'package:flutter/material.dart';
import 'package:untitled/views/company/company_fillup.dart';
import 'package:untitled/views/login.dart';
import '../../constants/top_bottom_clippings.dart';
import '../../constants/navigation_routes.dart';
import 'provider_signup.dart';

void main() {
  runApp(const MaterialApp(
    home: ProviderRegType(),
    debugShowCheckedModeBanner: false,
  ));
}

class ProviderRegType extends StatefulWidget {
  const ProviderRegType({super.key});

  @override
  State<ProviderRegType> createState() => ProviderRegTypeState();
}

class ProviderRegTypeState extends State<ProviderRegType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/loginBG.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ClipPath(
                  clipper: TopClipPath(),
                  child: Container(
                    color: const Color.fromARGB(255, 84, 122, 70),
                    height: 160,
                  ),
                ),
              ),
              ClipPath(
                clipper: TopClipPath(),
                child: Container(
                  color: const Color.fromARGB(150, 78, 112, 67),
                  height: 100,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 50),
          ),
          const Text(
            "Select your provider type",
            style: TextStyle(color: Colors.grey),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
          Column(
            children: [
              InkWell(
                onTap: (() {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const ProviderSignupPage()));
                }),
                child: Container(
                  height: 112,
                  width: 340,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      ),
                      Image.asset(
                        'assets/images/IndividualService.png',
                        width: 100,
                        height: 89,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10)),
                          Text(
                            'Individual',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Offer services as an',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text('individual provider.',
                              style: TextStyle(fontSize: 12))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0)),
          InkWell(
            onTap: () {
              Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const CompanyFillUp()));
            },
            child: Container(
              height: 112,
              width: 340,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  ),
                  Image.asset(
                    'assets/images/OfferServices.png',
                    width: 124,
                    height: 99,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 10)),
                      Text(
                        'Company',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Register your company and',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text('submit inquiry to become a',
                          style: TextStyle(fontSize: 12)),
                      Text(
                        'Unicon partner.',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 0)),
          InkWell(
            onTap: () {
              Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: const Text(
              "Already have an account?",
              style: TextStyle(color: Color.fromARGB(255, 56, 218, 72)),
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.6,
                    child: ClipPath(
                      clipper: BottomClipPath(),
                      child: Container(
                        color: const Color.fromARGB(255, 84, 122, 70),
                        height: 160,
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: TranspBottomClipPath(),
                    child: Container(
                      color: const Color.fromARGB(150, 78, 112, 67),
                      height: 160,
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}