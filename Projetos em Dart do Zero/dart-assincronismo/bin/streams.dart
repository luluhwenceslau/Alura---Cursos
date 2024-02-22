import 'dart:async';

void main()async{

  Stream myStream(int interval, [int? maxCount]) async*{
      int i = 1;
      while(i != maxCount){
        print('Counting: $i');
        await Future.delayed(Duration(seconds: interval));
        yield i++;
      }
      print('Finished!');
  }

  StreamSubscription mySubscriber = myStream(1,10).listen((event) {
    if(event.isEven){
      print('This number is Even!');
    }
   }, onError: (e){print('An Error happend! $e');
   }, onDone: (){print('The subscriber is gone :(');});

   await Future.delayed(Duration(seconds: 3));
   mySubscriber.pause();
   print('Stream Paused!');
   await Future.delayed(Duration(seconds: 3));
   mySubscriber.resume();
   print('Stream resumed!');
   await Future.delayed(Duration(seconds: 3));
   mySubscriber.cancel();
   print('Stream canceled');

  myStream(1, 10);
  print('Main is Finished!');
}
