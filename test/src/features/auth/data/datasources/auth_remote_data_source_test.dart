import 'dart:convert';

import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late AuthenticationRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = AuthenticationRemoteDataSourceImpl(mockHttpClient);
    registerFallbackValue(Uri());
  });

  group('createUser', () {
    final createdAt = DateTime.now().toIso8601String();
    const name = 'John Doe';
    const avatar = 'https://example.com/avatar.png';
    final createUserUri = Uri.parse('$kBaseUrl$kCreateUserEndpoint');
    test('should make a POST request with correct data', () async {
      // Arrange
      when(
        () => mockHttpClient.post(any(),
            body: any(named: 'body'),
            headers: {'Content-Type': 'application/json'}),
      ).thenAnswer((_) async => http.Response('', 201));

      // Act
      final methodCall = dataSource.createUser;
      expect(
        methodCall(
          createdAt: createdAt,
          name: name,
          avatar: avatar,
        ),
        completes,
      );
      // Assert
      verify(() => mockHttpClient.post(
            createUserUri,
            body: any(named: 'body'),
            headers: any(named: 'headers'),
          )).called(1);
      verifyNoMoreInteractions(mockHttpClient);
    });

    test('should throw [ServerException] on non-201 response', () async {
      // Arrange
      when(() => mockHttpClient.post(
            any(),
            body: any(named: 'body'),
            headers: any(named: 'headers'),
          )).thenAnswer((_) async => http.Response('Invalid email', 400));

      // Act
      final methodCall = dataSource.createUser;

      // Assert
      expect(
        () async => methodCall(
          createdAt: createdAt,
          name: name,
          avatar: avatar,
        ),
        throwsA(const ServerException('Invalid email', statusCode: 400)),
      );
      verify(() => mockHttpClient.post(
            createUserUri,
            body: any(named: 'body'),
            headers: any(named: 'headers'),
          )).called(1);
      verifyNoMoreInteractions(mockHttpClient);
    });
  });

  group('getUsers', () {
    final tUsers = [UserModel.empty];
    test('should make a GET request and return users', () async {
      // Arrange
      final mockResponse = http.Response(
        jsonEncode([tUsers.first.toMap()]),
        200,
      );
      when(() => mockHttpClient.get(any()))
          .thenAnswer((_) async => mockResponse);

      // Act
      final users = await dataSource.getUsers();

      // Assert
      expect(users, equals(tUsers));
      verify(() => mockHttpClient.get(Uri.parse('$kBaseUrl$kGetUsersEndpoint')))
          .called(1);
      verifyNoMoreInteractions(mockHttpClient);
    });

    test('should throw ServerException on non-200 response', () async {
      // Arrange
      when(() => mockHttpClient.get(any()))
          .thenAnswer((_) async => http.Response('Server Down', 500));

      // Act & Assert
      expect(
        () async => await dataSource.getUsers(),
        throwsA(const ServerException('Server Down', statusCode: 500)),
      );
      verify(() => mockHttpClient.get(Uri.parse('$kBaseUrl$kGetUsersEndpoint')))
          .called(1);
      verifyNoMoreInteractions(mockHttpClient);
    });
  });
}
