import 'package:dartz/dartz.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock
    implements AuthenticationRemoteDataSource {}

void main() {
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late AuthenticationRepositoryImpl repoImpl;

  const message = 'Unknown error occoured';
  const statusCode = 500;
  const serverException = ServerException(message, statusCode: statusCode);
  //STUB

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    repoImpl = AuthenticationRepositoryImpl(mockAuthRemoteDataSource);
  });
  group(
    'createUser',
    () {
      const params = CreatedUserParams(
        createdAt: "2023-12-22T16:44:25.355Z",
        name: 'John Doe',
        avatar: 'https://example.com/avatar.png',
      );
      test(
        'should call the [RemoteDataSource.createUser] and return the proper data'
        'sucessfully when the call to remote source is suscessfull',
        () async {
          // arrange
          when(() => mockAuthRemoteDataSource.createUser(
                createdAt: any(named: 'createdAt'),
                name: any(named: 'name'),
                avatar: any(named: 'avatar'),
              )).thenAnswer((_) async => Future.value());
          // act
          final result = await repoImpl.createUser(
            createdAt: params.createdAt,
            avatar: params.avatar,
            name: params.name,
          );
          // assert
          expect(result, equals(const Right(null)));
          verify(() => mockAuthRemoteDataSource.createUser(
                createdAt: any(named: 'createdAt'),
                name: any(named: 'name'),
                avatar: any(named: 'avatar'),
              )).called(1);
          verifyNoMoreInteractions(mockAuthRemoteDataSource);
        },
      );
      test(
        'shoudl return a [ServerFailure] when the call to the remote source unsuccssfull',
        () async {
          // arrange
          when(() => mockAuthRemoteDataSource.createUser(
                createdAt: any(named: 'createdAt'),
                name: any(named: 'name'),
                avatar: any(named: 'avatar'),
              )).thenThrow(
            const ServerException(message, statusCode: statusCode),
          );
          // act
          final result = await repoImpl.createUser(
            createdAt: params.createdAt,
            avatar: params.avatar,
            name: params.name,
          );
          // assert
          expect(
            result,
            equals(
              Left<Failure, void>(ServerFailure.fromException(serverException)),
            ),
          );

          verify(() => mockAuthRemoteDataSource.createUser(
                createdAt: any(named: 'createdAt'),
                name: any(named: 'name'),
                avatar: any(named: 'avatar'),
              )).called(1);
          verifyNoMoreInteractions(mockAuthRemoteDataSource);
        },
      );
    },
  );
  group('getUsers', () {
    // final List<UserModel> userModels = [];
    // final List<UserEntity> users = [];
    test(
      'should call [RemoteDataSource.getUsers] and return [List<User>] when call to remote source succesfull',
      () async {
        // arrange
        when(() => mockAuthRemoteDataSource.getUsers())
            .thenAnswer((_) async => []);
        // act
        final result = await repoImpl.getUsers();
        // assert
        expect(result, isA<Right<dynamic, List<UserEntity>>>());
        verify(() => mockAuthRemoteDataSource.getUsers()).called(1);
        verifyNoMoreInteractions(mockAuthRemoteDataSource);
      },
    );
    test(
      'shoudl return a [ServerFailure] when the call to the remote source unsuccssfull',
      () async {
        // arrange
        when(() => mockAuthRemoteDataSource.getUsers()).thenThrow(
          const ServerException(message, statusCode: statusCode),
        );
        // act
        final result = await repoImpl.getUsers();
        // assert
        expect(
          result,
          equals(Left<Failure, Null>(
            ServerFailure.fromException(serverException),
          )),
        );
        verify(() => mockAuthRemoteDataSource.getUsers()).called(1);
        verifyNoMoreInteractions(mockAuthRemoteDataSource);
      },
    );
  });
}
