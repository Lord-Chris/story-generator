abstract class IFailure {
  final String message;
  final dynamic data;

  IFailure({
    required this.message,
    this.data,
  });

  @override
  String toString() {
    return 'Failure{message: $message, data: $data}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IFailure &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          data == other.data;

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}

class Failure extends IFailure {
  Failure({
    required super.message,
    super.data,
  });

  factory Failure.fromHttpErrorMap(Map<String, dynamic> json) => Failure(
        message: json['message'] ?? json['errors']?['Message'],
        data: json,
      );
}

/// This is not to be used freely, it should be used as a fallback for errors
/// that need to be handled, especially for the API service where we don't know
/// all the errors beforehand.
class UnknownFailure extends IFailure {
  UnknownFailure({
    super.data,
    super.message =
        "Oops! App encountered an issue. We're on it. Please try again later or contact us.",
  });
}

/// Errors that come from API calls that return error codes 500 and above
class InternetFailure extends IFailure {
  InternetFailure({
    super.data,
    super.message = 'Please check your internet connection and try again.',
  });
}

/// Errors that come from API calls that return error codes 500 and above
class ServerFailure extends IFailure {
  ServerFailure({
    super.data,
    super.message =
        "Sorry, we're having trouble on our end. Please try again later or contact support for assistance.",
  });
}

/// Errors that come from serializing data
class TypeFailure extends IFailure {
  TypeFailure({
    super.message =
        'Sorry, we encounted an issue communicating to our server. We are working to fix it',
    super.data,
  });
}

/// Errors that come from serializing data
class ValidationFailure extends IFailure {
  ValidationFailure({
    super.message =
        'Validation Error! Please fill the fields properly or contact support for assistance.',
    super.data,
  });

  @override
  String get message {
    if (data == null) return super.message;
    if ((data['errors']['Message']).toString().contains('InstancePtr:')) {
      return super.message;
    }
    return (data['errors']['Message']).toString();
  }
}

class CoreFailure extends IFailure {
  CoreFailure({
    super.message =
        'Sorry, we had an issues setting up things for you. Please contact support!',
    super.data,
  });
}
