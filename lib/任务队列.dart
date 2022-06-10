


import 'dart:isolate';

void main(){
  var receivePort = new ReceivePort();
  receivePort.listen((message) {
    print(message);
    Future.microtask(() {
      print("微任务执行1");
    });
  });
  Future.microtask((){
    print("4444444444444");
  });
  receivePort.sendPort.send("发送消息给消息接收器1!");

  receivePort.sendPort.send("发送消息给消息接收器2!");

  receivePort.sendPort.send("发送消息给消息接收器3!");
}