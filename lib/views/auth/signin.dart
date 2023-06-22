import 'package:cassoa_traveller/views/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../reusablewidgets/tille.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var passportNumberController = TextEditingController();
  var passwordController = TextEditingController();
  late String animationURL;
  Artboard? _teddyArtboard;
  SMITrigger? successTrigger, failTrigger;
  SMIBool? isHandsUp, isChecking;
  SMINumber? numLook;

  StateMachineController? stateMachineController;

  @override
  void initState() {
    super.initState();

    animationURL = 'assets/rive/login.riv';
    rootBundle.load(animationURL).then(
      (data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        stateMachineController =
            StateMachineController.fromArtboard(artboard, "Login Machine");
        if (stateMachineController != null) {
          artboard.addController(stateMachineController!);

          stateMachineController!.inputs.forEach((e) {
            debugPrint(e.runtimeType.toString());
            debugPrint("name${e.name}End");
          });

          stateMachineController!.inputs.forEach((element) {
            if (element.name == "trigSuccess") {
              successTrigger = element as SMITrigger;
            } else if (element.name == "trigFail") {
              failTrigger = element as SMITrigger;
            } else if (element.name == "isHandsUp") {
              isHandsUp = element as SMIBool;
            } else if (element.name == "isChecking") {
              isChecking = element as SMIBool;
            } else if (element.name == "numLook") {
              numLook = element as SMINumber;
            }
          });
        }

        setState(() => _teddyArtboard = artboard);
      },
    );
    // recordFistVisit();
  }

  // recordFistVisit() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.clear();
  // }

  // Future<StateMachineController?> getArtboard(ByteData data) async {
  //   final file = RiveFile.import(data);
  //   print(file.header.fileId);
  //   print(data.lengthInBytes);

  //   setState(() {
  //     art = file.mainArtboard;
  //   });
  //   print(art!.height);
  //   print(art!.name);
  //   var controllers = StateMachineController.fromArtboard(art!, 'idle');

  //   return controllers;
  // }

  // initArtboard() {
  //   return rootBundle.load('assets/rive/login_screen.riv').then(
  //     (data) async {
  //       StateMachineController? stateMachineControllers =
  //           await getArtboard(data);
  //       setState(() {
  //         stateMachineController = stateMachineControllers;
  //       });
  //       if (stateMachineController != null) {
  //         art!.addController(stateMachineController!);
  //         for (var element in stateMachineController!.inputs) {
  //           if (element.name == "isChecking") {
  //             isChecking = element as SMIBool;
  //           } else if (element.name == "isHandsUp") {
  //             isHandsUp = element as SMIBool;
  //           } else if (element.name == "trigSuccess") {
  //             successTriger = element as SMITrigger;
  //           } else if (element.name == "trigFail") {
  //             failTrigger = element as SMITrigger;
  //           } else if (element.name == "numLook") {
  //             lookNum = element as SMINumber;
  //           }
  //         }
  //       } else {
  //         print('null null');
  //       }
  //       // art.addController(stateMachineController!);
  //       setState(() {
  //         artboard = art;
  //       });
  //     },
  //   );
  // }

  // checking() {
  //   isHandsUp.change(false);
  //   isChecking.change(true);
  //   lookNum.change(0);
  // }

  // moveEyes(value) {
  //   lookNum.change(value.length.toDouble());
  // }

  // handsUp() {
  //   isHandsUp.change(true);
  //   isChecking.change(false);
  // }

  // login() {
  //   isHandsUp.change(false);
  //   isChecking.change(false);
  //   if (passportNumberController.text == "admin" &&
  //       passwordController.text == 'aye') {
  //     successTriger.fire();
  //   } else {
  //     failTrigger.fire();
  //   }
  // }

  void handsOnTheEyes() {
    isHandsUp?.change(true);
  }

  void lookOnTheTextField() {
    print('object');
    print('object');
    print('object');
    print('object');
    isHandsUp?.change(false);
    isChecking?.change(true);
    numLook?.change(0);
  }

  void moveEyeBalls(val) {
    numLook?.change(val.length.toDouble());
  }

  void login() {
    isChecking?.change(false);
    isHandsUp?.change(false);
    if (passportNumberController.text == "admin" &&
        passwordController.text == "admin") {
      successTrigger?.fire();
    } else {
      failTrigger?.fire();
    }
  }

  void toSignUpPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd6e2ea),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Title1(
                color: Color(0xFF432a72),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (_teddyArtboard != null)
                      SizedBox(
                        width: 400,
                        height: 300,
                        child: Rive(
                          artboard: _teddyArtboard!,
                          fit: BoxFit.fitWidth,
                        ),
                      ),

                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xFF432a72),
                          borderRadius: BorderRadius.circular(5)),
                      height: MediaQuery.of(context).size.height / 3.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Passport Number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  gapPadding: 2,
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Color(0xFF432a72),
                                  ),
                                ),
                              ),
                              onTap: lookOnTheTextField,
                              obscureText: false,
                              controller: passportNumberController,
                              onChanged: (value) {
                                print(value);
                                moveEyeBalls(value);
                              },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  gapPadding: 2,
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Color(0xFF432a72),
                                  ),
                                ),
                              ),
                              onTap: handsOnTheEyes,
                              obscureText: true,
                              controller: passwordController,
                              onChanged: (value) {
                                print(value);
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  toSignUpPage();
                                },
                                child: const Text(
                                  'Create new account',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  login();
                                },
                                style: ButtonStyle(
                                  minimumSize:
                                      MaterialStateProperty.all(Size(100, 35)),
                                  elevation: MaterialStateProperty.all(0),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                                child: const Text('Sign in'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // FlatButton(
                    //   onPressed: () {
                    //     // Navigate to sign-up page
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => SignUpPage()),
                    //     );
                    //   },
                    //   child: Text('Sign Up'),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
