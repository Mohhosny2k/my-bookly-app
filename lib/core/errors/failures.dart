import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
       
      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      
      case DioErrorType.badCertificate:
        return ServerFailure('badCertificate with ApiServer');

      case DioErrorType.badResponse:
        // return ServerFailure('badResponse with ApiServer');
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceld');

      case DioErrorType.connectionError:
        return ServerFailure('Connection Error with ApiServer');

      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketExtention')){
          return ServerFailure('No Internet Connection');
        } 
          return ServerFailure('Unexpected Error , please try agin!');
          default:
          return ServerFailure('Opps There , please try agin');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try later!');
    } else if (statusCode == 404) {
      return ServerFailure('Internal Server, please try later!');
    } else {
      return ServerFailure('Opps There , please try agin');
    }
  }
}
