import 'package:flutter/material.dart';
import 'package:sampleproject/Setting%20Screen/settings.dart';
class TandC extends StatefulWidget {
  const TandC({super.key});

  @override
  State<TandC> createState() => _TandCState();
}

class _TandCState extends State<TandC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
      colors: [Colors.black45, Colors.deepOrange],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
        title: Text("Terms And Conditions"),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 27, fontWeight: FontWeight.w600, color: Colors.orange),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.orange,
          ),
          onPressed: () {
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SettingScreen()));
          },
        ),
        
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Terms Of Use:\n\n',
                  style: TextStyle(fontSize: 20.0,color: Colors.black ,fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                ),
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.circle,  size: 10.0),
                      ),
                    ),
                    TextSpan(
                          text: 'What is Sarmaya?\n\n',
                             style: TextStyle(fontSize: 18.0, color: Colors.black ,fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                  ),
                  ],
                ),
                 TextSpan(
                  text: 'Sarmaya is a mobile application that brings investor and enterpreneur to support eachother. It gives you opportunity to win cash prizes which changes your life.\n\n',
                  style: TextStyle(fontSize: 16.0,color: Colors.black , fontWeight: FontWeight.normal),
                  
                ),
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.circle,  size: 10.0),
                      ),
                    ),
                    TextSpan(
                          text: 'User Obligations\n\n',
                             style: TextStyle(fontSize: 18.0, color: Colors.black ,fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                  ),
                  ],
                  
                ),
                 TextSpan(
                   children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.square,  size: 10.0),
                      ),
                    ),
                    TextSpan(
                          text: 'You are responsible for your account:\n\n',
                             style: TextStyle(fontSize: 18.0,color: Colors.black , fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                  ),
                   ]
                ),
                 TextSpan(
                  text: 'To use many of the Services, you will need to register and create an account with a username and password. You must provide us with accurate and complete information, and you must update your account information as needed to keep the information accurate and complete.You may not impersonate anyone else. You are solely responsible for maintaining the confidentiality of your account and for all activities associated with or occurring under your account. If you suspect or discover any unauthorized use of your account, you should notify Sarmaya immediately by contacting us at support@sarmaya.com. We are not responsible for any loss or damage arising from your failure to comply with the foregoing requirements or as a result of use of your account with or without your knowledge.\n\n',
                  style: TextStyle(fontSize: 16.0,color: Colors.black , fontWeight: FontWeight.normal),
                  
                ),
                 TextSpan(
                   children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.square,  size: 10.0),
                      ),
                    ),
                    TextSpan(
                          text: 'Follow the law and Our policies:\n\n',
                             style: TextStyle(fontSize: 18.0,color: Colors.black , fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                  ),
                   ]
                ),
                 TextSpan(
                  text: 'You may not take any action that infringes or violates other people’s rights, violates the law, or breaches any contract or legal duty you may have toward any party. You may not offer Perks that are illegal, violate any of Indiegogo’s policies, rules, or guidelines, or violate any applicable law, statute, ordinance, or regulation.\n\n',
                  style: TextStyle(fontSize: 16.0, color: Colors.black ,fontWeight: FontWeight.normal),
                  
                ),
                TextSpan(
                   children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.square,  size: 10.0),
                      ),
                    ),
                    TextSpan(
                          text: 'Be Truthful:\n\n',
                             style: TextStyle(fontSize: 18.0,color: Colors.black , fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                  ),
                   ]
                ),
                 TextSpan(
                  text: 'Do not post information you know is false, misleading, or inaccurate. Do not do anything deceptive or fraudulent.\n\n',
                  style: TextStyle(fontSize: 16.0,color: Colors.black , fontWeight: FontWeight.normal),
                  
                ),
                TextSpan(
                   children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.square,  size: 10.0),
                      ),
                    ),
                    TextSpan(
                          text: 'Respect the rights of others:\n\n',
                             style: TextStyle(fontSize: 18.0,color: Colors.black , fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                  ),
                   ]
                ),
                 TextSpan(
                  text: 'You may not threaten, abuse, harass, defame, or engage in behavior that is libelous, tortious, obscene, profane, or invasive of another’s privacy.\n\n',
                  style: TextStyle(fontSize: 16.0,color: Colors.black , fontWeight: FontWeight.normal),
                  
                ),
                TextSpan(
                   children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.square,  size: 10.0),
                      ),
                    ),
                    TextSpan(
                          text: 'Avoid spam and unsolicited communications:\n\n',
                             style: TextStyle(fontSize: 18.0,color: Colors.black , fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                  ),
                   ]
                ),
                 TextSpan(
                  text: 'You may not distribute unsolicited or unauthorized advertising or promotional material, or any junk mail, spam, or chain letters. \n\n',
                  style: TextStyle(fontSize: 16.0,color: Colors.black , fontWeight: FontWeight.normal),
                  
                ),
                TextSpan(
                   children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.square,  size: 10.0),
                      ),
                    ),
                    TextSpan(
                          text: 'Respect the rights of others:\n\n',
                             style: TextStyle(fontSize: 18.0,color: Colors.black , fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                  ),
                   ]
                ),
                 TextSpan(
                  text: 'You may not threaten, abuse, harass, defame, or engage in behavior that is libelous, tortious, obscene, profane, or invasive of another’s privacy.\n\n',
                  style: TextStyle(fontSize: 16.0,color: Colors.black , fontWeight: FontWeight.normal),
                  
                ),
                TextSpan(
                  text: 'If you violate any of the Terms of Use, We reserve the right to terminate, suspend. You may not access Our application or Services if We have prohibited you from doing so.\n\n',
                  style: TextStyle(fontSize: 18.0,color: Colors.black , fontWeight: FontWeight.normal),
                  
                ),
                 TextSpan(
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.circle,  size: 10.0),
                      ),
                    ),
                    TextSpan(
                          text: 'Enterpreneur Obligations\n\n',
                             style: TextStyle(fontSize: 18.0,color: Colors.black , fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                  ),
                  ],
                  
                ),
                 TextSpan(
                  text: 'When you create a buisneess proposal on the application and ask for investments, you understand that you are entering into separate legal agreements with both Sarmaya and with your Investors, and the following rules apply.\n\n',
                  style: TextStyle(fontSize: 18.0,color: Colors.black , fontWeight: FontWeight.normal),
                ),
                  TextSpan(
                   children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.square,  size: 8.0),
                      ),
                    ),
                    TextSpan(
                          text: 'Make good faith efforts to fulfill the Perks associated with Your Proposal in the timeframe that You communicate to Investors, and prioritize fulfillment of those Perks.\n\n',
                             style: TextStyle(fontSize: 16.0, color: Colors.black ,fontWeight: FontWeight.normal),
                                  ),
                   ]
                ),
                TextSpan(
                   children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.square,  size: 8.0),
                      ),
                    ),
                    TextSpan(
                          text: 'Updates. Provide substantive and quality updates at least once a month to Investors. Immediately notify Investors if there are obstacles or delays.\n\n',
                             style: TextStyle(fontSize: 16.0,color: Colors.black , fontWeight: FontWeight.normal),
                                  ),
                   ]
                ),
               
                  
                
              ],
            ),
                  ),
          ),
      ),
      )
    );
  }
}