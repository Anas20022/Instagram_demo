import 'package:first_project_1/models/sp_signIn.dart';
import 'package:flutter/material.dart';

import '../../main_screen.dart';
import '../../theme/colors.dart';
import '../widgets/selector_indecator_widget.dart';
import '../widgets/out_boarding_widget.dart';

class OutBoardingScreen extends StatefulWidget {


  OutBoardingScreen({super.key});

  @override
  State<OutBoardingScreen> createState() => _outBoardingScreenState();
}

class _outBoardingScreenState extends State<OutBoardingScreen> {
  int _currentPage = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Visibility(
              replacement: TextButton(
                onPressed: () {},
                child: Text(
                  "start",
                  style: TextStyle(fontSize: 18, color: primary),
                ),
              ),
              visible: _currentPage != 2,
              // maintainAnimation: true,
              // maintainState: true,
              // maintainSize: true,
              child: TextButton(
                onPressed: () {
                  pageController.animateToPage(2,
                      duration: Duration(seconds: 1), curve: Curves.easeIn);
                },
                child: Text(
                  "skip",
                  style: TextStyle(fontSize: 18, color: primary),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              onPageChanged: (v) {
                _currentPage = v;
                setState(() {});
              },
              controller: pageController,
              scrollDirection: Axis.horizontal,
              children: [
                OutBoardingWidget(
                    imgUrl: "assets/images/Illus - 5.png",
                    address: "View product 360 degrees",
                    discreption:
                        "You can see the product with all angles, true and convenient"),
                OutBoardingWidget(
                    imgUrl: "assets/images/Illus - 6.png",
                    address: "Find products easily",
                    discreption:
                        "You just need to take a photo or upload and we will find similar products for you."),
                OutBoardingWidget(
                    imgUrl: "assets/images/Illus - 7.png",
                    address: "Payment is easy",
                    discreption:
                        "You just need to take a photo or upload and we will find similar products for you."),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContainerPageSelectorIndecator(currentPage: _currentPage==0),
              ContainerPageSelectorIndecator(currentPage: _currentPage==1),
              ContainerPageSelectorIndecator(currentPage: _currentPage==2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // SizedBox(width: 0,),
              IconButton(
                  onPressed: () {
                    if(_currentPage!=0) {
                      pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.easeOutCirc);
                    }
                    // if(0<_currentPage && _currentPage<=2)
                    // pageController.jumpToPage(--_currentPage);
                    setState(() {});
                  },
                  icon: Icon(Icons.arrow_back_ios),color: _currentPage==0?Colors.grey:primary),
              IconButton(
                  onPressed: () {
                    if(_currentPage!=2) {
                      pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInCirc);
                    }

                    // if (0 <= _currentPage && _currentPage < 2)
                    //   pageController.jumpToPage(++_currentPage);
                    setState(() {});
                  },
                  icon: Icon(Icons.arrow_forward_ios),color: _currentPage==2?Colors.grey:primary),
              // SizedBox(width: 0,),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Visibility(
              maintainState: true,
              maintainSize: true,
              maintainAnimation: true,
              visible: _currentPage == 2,
              /************************************************************/
              child: ElevatedButton(
                // onPressed: (){
                //        Navigator.pushReplacementNamed(context,"/login_screen");
                //
                // },
                onPressed: (){
                  if(SpHelperSignIn.spHelper.sharedPreferences!.getString("user")== null){
                    Navigator.pushReplacementNamed(context,"/login_screen");
                  } else{
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return MainScreen();
                        }));
                  }
                },
                /************************************************************/
                child: Text(
                  "Start",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: primary),
              ),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   // crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     TabPageSelectorIndicator(
          //       backgroundColor: _currentPage==0?Color(0xff895F44):Colors.transparent,
          //       borderColor: _currentPage==0?Colors.transparent:Colors.grey,
          //       size: 13,
          //     ),
          //     TabPageSelectorIndicator(
          //       backgroundColor: _currentPage==1?Color(0xff895F44):Colors.transparent,
          //       borderColor: _currentPage==1?Colors.transparent:Colors.grey,
          //       size: 13,
          //     ),
          //     TabPageSelectorIndicator(
          //       backgroundColor: _currentPage==2?Color(0xff895F44):Colors.transparent,
          //       borderColor: _currentPage==2?Colors.transparent:Colors.grey,
          //       size: 13,
          //     ),
          //
          //   ],
          // ),

          SizedBox(
            height: 15,
          )

          // ElevatedButton(onPressed: (){}, child: Text("Enter")),
        ],
      ),
    );
  }
}



