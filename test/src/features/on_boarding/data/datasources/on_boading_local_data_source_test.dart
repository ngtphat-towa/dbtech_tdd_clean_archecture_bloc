import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/exception.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/data/datasources/on_boading_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late OnBoardingLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = OnBoardingLocalDataSourceImpl(mockSharedPreferences);
  });

  group('cacheFirstTimer', () {
    test('should cache first timer successfully', () async {
      // Arrange
      when(() => mockSharedPreferences.setBool(any(), any()))
          .thenAnswer((_) async => true);

      // Act
      await dataSource.cacheFirstTimer();

      // Assert
      verify(
        () => mockSharedPreferences.setBool(
          OnBoardingLocalDataSourceImpl.firstTimerKey,
          true,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockSharedPreferences);
    });

    test('should throw a CacheException when caching fails', () async {
      // Arrange
      when(() => mockSharedPreferences.setBool(any(), any()))
          .thenThrow(Exception());

      // Act & Assert
      expect(
        () => dataSource.cacheFirstTimer(),
        throwsA(isInstanceOf<CacheException>()),
      );
      verify(
        () => mockSharedPreferences.setBool(
          OnBoardingLocalDataSourceImpl.firstTimerKey,
          true,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockSharedPreferences);
    });
  });

  group('checkIfUserIsFirstTimer', () {
    test('should return true if user is considered first time', () async {
      // Arrange
      when(() => mockSharedPreferences.getBool(any())).thenReturn(true);

      // Act
      final result = await dataSource.checkIfUserIsFirstTimer();

      // Assert
      expect(result, true);
      verify(
        () => mockSharedPreferences.getBool(
          OnBoardingLocalDataSourceImpl.firstTimerKey,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockSharedPreferences);
    });

    test('should return true if user is considered first time', () async {
      // Arrange
      when(() => mockSharedPreferences.getBool(any()))
          .thenReturn(null); // Simulate user being considered first time

      // Act
      final result = await dataSource.checkIfUserIsFirstTimer();

      // Assert
      expect(result, true);
      verify(
        () => mockSharedPreferences.getBool(
          OnBoardingLocalDataSourceImpl.firstTimerKey,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockSharedPreferences);
    });

    test('should throw a CacheException when checking user status fails',
        () async {
      // Arrange
      when(() => mockSharedPreferences.getBool(any())).thenThrow(Exception());

      // Act & Assert
      expect(
        () => dataSource.checkIfUserIsFirstTimer(),
        throwsA(isInstanceOf<CacheException>()),
      );
      verify(
        () => mockSharedPreferences.getBool(
          OnBoardingLocalDataSourceImpl.firstTimerKey,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockSharedPreferences);
    });
  });
}
