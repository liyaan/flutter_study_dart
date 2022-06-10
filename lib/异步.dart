


import 'dart:isolate';

int i = 0;
void main(){
  i = 10;
  //var message = "message";
  // Isolate.spawn(entryPoint, message);
  var receivePort = new ReceivePort();
  Isolate.spawn(entryPoint, receivePort.sendPort);
  receivePort.listen((message) {
    if(message is SendPort){
      message.send("main hello word");
    }else{
      print(message);
    }
  });
  Isolate.spawn(i1, "");
  Isolate.spawn(i2, "");
  while(true){}
}
void i1(msg){
  print("isolate1 执行");
  Future.doWhile(() {
    print("isolate1 future");
    return true;
  });
}
void i2(msg){
  print("isolate2 执行");
  Future.doWhile((){
    print("isolate2 future");
    return true;
  });
}
// void entryPoint(var message){
//   print(message);
// }
void entryPoint(SendPort sendPort){
  sendPort.send("1");
  sendPort.send("1");
  sendPort.send("1");
  sendPort.send(2);
  var receivePort = new ReceivePort();
  var sendPort2 = receivePort.sendPort;
  sendPort.send(sendPort2);
  receivePort.listen((message) {
    print(message);
  });
}