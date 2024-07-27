import 'dart:developer';

import 'package:googleapis_auth/auth_io.dart';

class NotificationAccessToken {
  static String? _token;

  // To generate token only once for an app run
  static Future<String?> get getToken async => _token ?? await _getAccessToken();

  // To get admin bearer token
  static Future<String?> _getAccessToken() async {
    try {
      const fMessagingScope =
          'https://www.googleapis.com/auth/firebase.messaging';

      final client = await clientViaServiceAccount(
        // Dummy JSON for the service account
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "dummy-project-id",
          "private_key_id": "dummy-private-key-id",
          "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCyCbypCM0SQJ6q\nFYM/DLvkFZYu4apFQ7KK6qnh/1V6vzQEoqhRzuOx16l0qK1JL8smVNONGUuQ8FXM\npmiRgir4HGcQ08QXPLCbccg8ZNsRFNasYhb0q0Sz111aXIvKv9Ad5FlAkl9PamE2\nBT+/xS5aE5daq+g4W6KOIPenTTDDbfrG5LyEQ1LQ7/02XE8f0tcrG2k7DgWnU0c6\nIlgBBNc9beRPsN5XeP/Bx4p6VayST5OiK619XOCuVEQTJnyABUrEmWBngndWDY6e\na9NJD3/9WZffYty4VeGDPpBn8V4oqpZhC9NznNWgONXGuLGqQQ4fP0Be5I/1txJ1\nSBjFE2JnAgMBAAECggEAUm9xvG7HzWDAVo6Zc7MouIZKQLDajzG2VN4tBOieIrSv\nmEncV+zMvwbVfp+vhMitbrUuMxH4TEcL4zNWDbHQxYsZKdBz5jKCr6byiQxF5tXY\nRH8yk91NdVwN7I4XaCyCZ6TYsq5TlUjzc/jgOKJLQQf7N8+LObUsQlT/dqamIoZd\n+g1AWEwJmF5sq8crg7d+MacSzg7u+poX5VmqOsDrgmTiEI1A4fPpvgIS5Ez08yDe\nMMpKv+/Xs9FnWMIKU9Ex8IW2xhB3qvypupi9lLYtEk6EABgE8rTrdqX2/xUDWWds\nMrzpVUoyBow/DI3hZilyfKoYwCWnUMm85w1r2HhhAQKBgQDu0c1D9KnesuPZNb25\nUC/P2bPJZ/kA8B1t/uD1wfRUNmeougMzNwgQ6rTypjU3Ag5ImPhuHAQ9sxogIx7u\nipID7UUuqCD6z8eD8+7yOwWhRq5jofMrj5oiVzWO2qf17XndN1OnuTGXCpSq9jC+\nimw2lusTjCAc1G20TVxGFxbn5wKBgQC+2I7iNnVFaRaZ8L5hE53ZdPp8/5GqJ95I\nqbuP4h7PJUpgn/fPw48cu/5dF4JI3f9LCfBCOKt1gQjcyvUCwsKwl70l5XxQ8Exl\niAWA9h1+ov+ux+BGOQIWW0ZiHRNCXZH7Ac5oiRQyJs17uHRTxToHscv78PUhvbzU\nb1LMKMZhgQKBgQCzLmBW0zO8bfW727FsX3hv90QIIeVWSdGa3LfGS+5YXLVrh5yt\nCWYY4zA+OmwEyJsU5wjF/GlGLaG1aQRlLzyci6Hzfpu38rscCqJFxfjUZyaihDjh\nfw3DJDF/7BhG0RU037T5S16kl4CxwKMT4uGMF7FqaiER4GQq+jv4Loy2EwKBgB/C\nNfTbDyTf2g0ADQ5mj0wStWR7uyfPvqPk6vuEq4/ZKsltlXWTm4sylZ+0O9AYcVVx\nb/P1LkM9l9X2SFOPSYrNlYJq8AcgFfaHbjMJwdrDET1qsZ29+uTxh4LoR74xiAt3\nP3wR47R81JEUHveZyJBjPAjPDlvxES1g4SxsVKcBAoGBANok42uCFXdzkcxRwt25\nFsZzGBCTtPLZvFr7SYCB2Z2PrdXElkp6vSO1tif9+HOYODP1wmwhg6zpDSue2Lr9\nz+Rm6BeMIr8cqKpJdUT76xex7eT9hAzFpH4/mNR43FRDNpOQAPQIdF4WcMeQ/BLs\nR3WQAaynaKCHZyOEOLDAx35o\n-----END PRIVATE KEY-----\n",
          "client_email": "dummy-client-email@dummy-project-id.iam.gserviceaccount.com",
          "client_id": "dummy-client-id",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/dummy-client-email%40dummy-project-id.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }),
        [fMessagingScope],
      );

      _token = client.credentials.accessToken.data;

      return _token;
    } catch (e) {
      log('$e');
      return null;
    }
  }
}
