import 'package:flutter/material.dart';
class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // To add Icon Image
var cross=Icon(Icons.cancel,size: 80,);
var circle=Icon(Icons.circle,size: 80,);
var edit=Icon(Icons.edit,size: 80,);

bool iscross=true;
String? message;
List<String> gameState = List.empty(growable: true);



//imitalization box with empty value

@override
  void initState() {
  gameState=List.filled(9, "empty");
  this.message="";
    super.initState();
  }
//To play  game
playGame(int index){

  if(this.gameState[index]=="empty"){
    setState(() {
      
      if(this.iscross){
        this.gameState[index]="cross";

      }
      else{
        this.gameState[index]="circle";
      }
      iscross=!iscross;
      checkwin();
    });
  }
}
//Reset game
resetGame(){
  setState(() {
     gameState=List.filled(9, "empty");
  this.message="";
  });
}

//To get icon image
Icon getIcon(String title){
  switch(title){
    case('empty'):
    return edit;

    case('cross'):
    return cross;
    case('circle'):
return circle;
default:
return edit;
  }
}
//check for winning
checkwin(){
  if(gameState[0] !="empty"&& gameState[0]==gameState[1]&& gameState[1]==gameState[2]){
    setState(() {
      
      this.message=this.gameState[0]+'win';
    });

  }else if(gameState[3] !="empty"&& gameState[3]==gameState[4]&& gameState[4]==gameState[5]){
    setState(() {
      
      this.message=this.gameState[3]+'win';
    });

  }else if(gameState[6] !="empty"&&
  gameState[6]==gameState[7]&&
  gameState[7]==gameState[8]){
    setState(() {
      
      this.message=this.gameState[0]+'win';
    });

  }else if((gameState[0] !="empty")&&
  (gameState[0]==gameState[3])&&
  (gameState[3]==gameState[6])){
    setState(() {
      
      this.message=this.gameState[0]+'win';
    });

  }else if((gameState[1] !="empty")&&
  (gameState[1]==gameState[4])&&
  (gameState[4]==gameState[7])){
    setState(() {
      
      this.message=this.gameState[1]+'win';
    });

  }else if((gameState[2] !="empty")&&
  (gameState[2]==gameState[5])&&
  (gameState[5]==gameState[8])){
    setState(() {
      
      this.message=this.gameState[2]+'win';
    });

  }else if((gameState[0] !="empty")&&
  (gameState[0]==gameState[4])&&
  (gameState[4]==gameState[8])){
    setState(() {
      
      this.message=this.gameState[0]+'win';
    });

  }else if((gameState[2] !="empty")&&
  (gameState[2]==gameState[4])&&
  (gameState[4]==gameState[6])){
    setState(() {
      
      this.message=this.gameState[2]+'win';
    });

  }else if (!gameState.contains("empty")){
    setState(() {
      message="Game Draw";
    });
  }

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

Expanded(
  child: GridView.builder(
    padding: EdgeInsets.all(10),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 1.0,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      
      
      ),



      itemCount: gameState.length,



     itemBuilder:(context,i)=>SizedBox(
       width: 100,
       height: 100,
       child: MaterialButton(onPressed: (){
         this.playGame(i);


       },
       child: getIcon(this.gameState[i]),
       
       ),
       

       
     )),
),
Text(message ??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),


Container(
  child:   MaterialButton(
  
    color: Colors.blue[800],
  
    onPressed: (){
  
    resetGame();
  
  },
  
  child: Text("Reset Game",style: TextStyle(color: Colors.white),),
  
  
  
  
  
  
  
  ),
),
SizedBox(height: 100,),

Text("Flutterwith skm")



        ],
      ),
      
    );
  }
}