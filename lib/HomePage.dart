import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Todo: link up images
  AssetImage cross=AssetImage("images/cross.png");
  AssetImage circle=AssetImage("images/circle.png");
  AssetImage edit=AssetImage("images/edit.png");

  bool isCross=true;
  String message;
  List<String>gameState;

  //Todo:initialze the state of  box with empty
  @override
  void initState() {
    super.initState();
    setState(() {
     this.gameState=[
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
     ];
     this.message="";
    });
  }


  //Todo:playGame method
  playGame(int index){
    if(this.gameState[index]=="empty"){
      setState(() {
       if(this.isCross) {
         this.gameState[index]="cross";
       }else{
         this.gameState[index]="circle";
       }
       this.isCross=!this.isCross;
       this.checkWin();
      });
    }
  }


  //Todo:reset game method
  resetGame(){
    setState(() {
     this.gameState=[
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       
     ]; 
     this.message="";
    });
  }

  //Todo: get image method
  AssetImage getImage(String value){
    switch(value){
      case('empty'):
        return edit;
        break;
      case('cross'):
        return cross;
        break;
      case('circle'):
        return circle;
        break;    

    }
  }

  //Todo: check for win logic
  checkWin(){
    if((gameState[0]!='empty')&&(gameState[0]==gameState[1])&&(gameState[1]==gameState[2])){
      setState(() {
       this.message='${this.gameState[0]} wins'; 
      });
    }else if((gameState[3]!='empty')&&(gameState[3]==gameState[4])&&(gameState[4]==gameState[5])){
      setState(() {
       this.message='${this.gameState[3]} wins'; 
      });
    }else if((gameState[6]!='empty')&&(gameState[6]==gameState[7])&&(gameState[7]==gameState[8])){
      setState(() {
       this.message='${this.gameState[6]} wins'; 
      });
    }else if((gameState[0]!='empty')&&(gameState[0]==gameState[3])&&(gameState[3]==gameState[6])){
      setState(() {
       this.message='${this.gameState[0]} wins'; 
      });
    }else if((gameState[1]!='empty')&&(gameState[1]==gameState[4])&&(gameState[4]==gameState[7])){
      setState(() {
       this.message='${this.gameState[1]} wins'; 
      });
    }else if((gameState[2]!='empty')&&(gameState[2]==gameState[5])&&(gameState[5]==gameState[8])){
      setState(() {
       this.message='${this.gameState[2]} wins'; 
      });
    }else if((gameState[0]!='empty')&&(gameState[0]==gameState[4])&&(gameState[4]==gameState[8])){
      setState(() {
       this.message='${this.gameState[0]} wins'; 
      });
    }else if((gameState[2]!='empty')&&(gameState[2]==gameState[4])&&(gameState[4]==gameState[6])){
      setState(() {
       this.message='${this.gameState[2]} wins'; 
      });
    } else if (!gameState.contains('empty')){
      setState(() {
       this.message='Game Draw'; 
      });
    }            
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,   //how many element we require in each row
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,  //how much space is there in between each grid(in a row)

                mainAxisSpacing: 10.0,   // how much space is between upper and lower grid.
              ),
              itemCount: this.gameState.length, //we can write 9 also
              itemBuilder: (context ,i)=>SizedBox(
                width: 100.0,
                height: 100.0,
                child: MaterialButton(
                  onPressed:(){
                    this.playGame(i);
                  },
                  child: Image(
                    image: this.getImage(this.gameState[i]),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(this.message,style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),),
            
          ),
          MaterialButton(
            color: Colors.purple,
            minWidth: 300.0,
            height: 50.0,
            child: Text("Reset Game",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            )),
            onPressed: (){
              resetGame();
            },
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text("Wizards.in",
            style: TextStyle(fontSize: 18.0),),
          )

        ],


      ),
      
    );
  }
}