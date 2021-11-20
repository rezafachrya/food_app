part of 'entities.dart';

//untuk menampung error pada usecase
class AppError extends Equatable {
  final AppErrorType appErrorType;

  const AppError(this.appErrorType);

  @override
  List<Object> get props => [appErrorType];
}

enum AppErrorType { api, network, database, unauthorised, sessionDenied }
