import 'package:flutter/material.dart';
import 'package:pdpui_3/pages/home.dart';

import 'package:pdpui_3/utils/Strings.dart';

class intro extends StatefulWidget {
  const intro({Key? key}) : super(key: key);
  static final String id = "intro";

  @override
  State<intro> createState() => _introState();
}

class _introState extends State<intro> {
  var _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController=PageController(
      initialPage: 0
    );
  }
  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //
      //   elevation: 0,
      //   backgroundColor: Colors.black,
      //   actions: [
      //     GestureDetector(
      //       child:   Padding(padding: EdgeInsets.only(right: 20,left: 20),child: Text("Skip",style: TextStyle(color: Colors.white),),),
      //       onTap: (){Navigator.pushNamed(context, home.id);}),
      //   ],
      // ),
      body: Stack(alignment: Alignment.bottomCenter,
        children: [
          PageView(

            onPageChanged: ( int page){
            setState(() {
              currentIndex=page;
            });
          },
          controller: _pageController,

            children: [
              makePage(
                title: Strings.stepOneTittle,
                content: Strings.stepOneContent,
                image: "assets/images/image_1.png",
              ),
              makePage(
                title: Strings.stepTwoTittle,
                content: Strings.stepTwoContent,
                image: "assets/images/image_2.png",
                ),

              makePage(
                title: Strings.stepThreeTittle,
                content: Strings.stepThreeContent,
                image: "assets/images/image_3.png",
                             ),



            ],
          ),
          Container(
            margin:EdgeInsets.only(bottom: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: _build()
    ),

             ),

          Container(
            margin:EdgeInsets.only(left:  200,bottom: 40),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _build1(),
            ),

          ),



        ],

      ),
    );
  }

  Widget makePage({image,title,content}){
    return Container(
      padding: EdgeInsets.only(left: 50,right: 50,bottom: 50,top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(title,style: TextStyle(color: Colors.redAccent,fontSize: 30),
              ),
              SizedBox(height: 30,),
              Text(content,style: TextStyle(color: Colors.grey,fontSize: 20,),
              ),
              SizedBox(height: 30,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Image(
                   image: AssetImage(image),
                   // fit: BoxFit.cover,
                    )

              ),

            ],
          )
        ],

      ),

    );
  }


  Widget _indicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 16,width: 16,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        //color: Colors.green,
          color: isActive? Colors.pink:Colors.orangeAccent,
        borderRadius: BorderRadius.circular(10)

      ),


    );
  }
    List<Widget> _build (){
    List<Widget> indicators = [];
    for (int i = 0; i<3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
      return indicators;
    }

  Widget _indicator1(bool isActive1){
    return FlatButton(
        onPressed: () {isActive1? null:Navigator.pushNamed( context, home.id );
           },
        child:  Text("skip", style: TextStyle(color: isActive1?  Colors.grey: Colors.black),),);
      // ElevatedButton(
      //   style:  ElevatedButton.styleFrom(),
      //
      //
      //   onPressed: () {isActive1? null:Navigator.pushNamed( context, home.id );
      //   },
      //   child: isActive1? null: Text("skip", style: TextStyle(backgroundColor: Colors.transparent),),
      //
      //  );
  }

  List<Widget> _build1 (){
    List<Widget> indicators1 = [];

      if (currentIndex <= 1) {
        indicators1.add(_indicator1(true));
      } else {
        indicators1.add(_indicator1(false));
          }
    return indicators1;
  }

  }



















