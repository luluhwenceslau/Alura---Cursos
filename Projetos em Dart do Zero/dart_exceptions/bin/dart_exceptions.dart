import 'controllers/bank_controller.dart';
import 'exeptions/bank_controller_exeptions.dart';
import 'models/account.dart';

void main() {
  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try{
    bool result = bankController.makeTransfer(
      idSender: "Kako", idReceiver: "Ricarth", amount: 500);

      if(result){
        print('Transação concluída com sucesso!');
      }

  } on SenderIdInvalidException catch (e){
      print(e);
      print('O ID ~${e.idSender}~ do remetente não é um id valido!');
  } on ReceiverIdInvalidException catch (e){
      print(e);
      print('O ID ~${e.idReceiver}~ do destinatário não é um id valido!');
  } on SenderNotAuthenticatedException catch (e){
      print(e);
      print('O usuário de ID ~${e.idSender}~ não é autenticado!');
  } on ReceiverNotAuthenticatedException catch (e){
      print(e);
  } on SenderBalanceLowerException catch (e){
      print(e);
      print('O usuário ${e.idSender} tentou enviar ${e.amount} porém sua conta possui saldo de ${e.senderBalance} reais.');
  } on Exception{
    print('Ops! Algo deu errado!');
  }
}
 