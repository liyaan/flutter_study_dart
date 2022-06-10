
import 'dart:io';

void main(){
  new File(r"C:\windows-version.txt").readAsBytes().then((value){
      print(value);
  });
  var dst = new File(r"C:\windows-version1.txt");
  var write = dst.openWrite();
  Stream<List<int>> stream = new File(r"C:\windows-version1.txt").openRead();
  var listen = stream.listen((s){
    print("stream");
    write.add(s);
  });
}