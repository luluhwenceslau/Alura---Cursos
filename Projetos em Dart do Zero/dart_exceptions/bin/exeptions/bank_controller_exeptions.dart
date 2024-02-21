class SenderIdInvalidException implements Exception{
  static const String report = "SenderIdInvalidException";
  String idSender;
  SenderIdInvalidException({required this.idSender});

  @override
  String toString(){
    return "$report\nID Sender: $idSender";
  }
}

class ReceiverIdInvalidException implements Exception {
  static const String report = "ReceiverIdInvalidException";
  String idReceiver;
  ReceiverIdInvalidException({required this.idReceiver});

  @override
  String toString(){
    return "$report\nID Receiver: $idReceiver";
  }
}

class SenderNotAuthenticatedException implements Exception {
  static const String report = "SenderNotAuthenticatedException";
  String idSender;
  SenderNotAuthenticatedException({required this.idSender});

  @override
  String toString(){
    return "$report\nID Sender: $idSender";
  }
}

class ReceiverNotAuthenticatedException implements Exception {
  static const String report = "ReceiverNotAuthenticatedException";

  String idReceiver;
  late String message;
  ReceiverNotAuthenticatedException({required this.idReceiver}) {
    message = "$report\nID Sender: $idReceiver";
  }

  @override
  String toString() {
    return message;
  }
}

class SenderBalanceLowerException implements Exception{
  static const String report = "SenderBalanceLowerException";
  String idSender;
  double senderBalance;
  double amount;
  SenderBalanceLowerException({required this.idSender, required this.senderBalance, required this.amount});

  @override
  String toString(){
    return "$report\nID Sender: $idSender\nSender Balance: $senderBalance\nAmount: $amount";
  }
}
