void f(Function f){
  f();
}

typedef void f1(int i,int j);
void f2(f1 f){
  f(2,3);
}

void f3(void f4(int i,int j)){
  f4(5,7);
}

void f5([int i=1,int j=2]){
  print("i=$i j=$j");
}
void f6({int i=1,int j=2}){
  print("i=$i j=$j");
}
void main(){
  var j = "aaaa";
  final int a = 100;
  const int A_CONST = 200;
  num n = 1;
  int i = n as int;
  var b = 1;
  if(b is int){

  }else if(b is String){

  }

  String? str;
  if(str==null){
    str = "123";
  }
  print(str);
  str = null;
  str ??= "456";
  print(str);
  str = null;
  var strs = str ?? "789";
  print(strs);
  f((){
    print("text function");
  });
  f2((int i,int j){
    print("text function $i $j");
  });

  f3((i, j) {
    print("text function3 $i $j");
  });
  f5();
  f6(i:10);
  new Builder()..a()..b();
}

class Builder{
  void a(){
    print("a method");
  }
  void b(){
    print("b method");
  }
}