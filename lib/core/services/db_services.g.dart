// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_services.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class FavoriteMealData extends DataClass
    implements Insertable<FavoriteMealData> {
  final String idMeal;
  final String strMeal;
  final String strDrinkAlternate;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  FavoriteMealData(
      {required this.idMeal,
      required this.strMeal,
      required this.strDrinkAlternate,
      required this.strCategory,
      required this.strArea,
      required this.strInstructions,
      required this.strMealThumb});
  factory FavoriteMealData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FavoriteMealData(
      idMeal: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_meal'])!,
      strMeal: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_meal'])!,
      strDrinkAlternate: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}str_drink_alternate'])!,
      strCategory: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_category'])!,
      strArea: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_area'])!,
      strInstructions: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_instructions'])!,
      strMealThumb: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_meal_thumb'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_meal'] = Variable<String>(idMeal);
    map['str_meal'] = Variable<String>(strMeal);
    map['str_drink_alternate'] = Variable<String>(strDrinkAlternate);
    map['str_category'] = Variable<String>(strCategory);
    map['str_area'] = Variable<String>(strArea);
    map['str_instructions'] = Variable<String>(strInstructions);
    map['str_meal_thumb'] = Variable<String>(strMealThumb);
    return map;
  }

  FavoriteMealCompanion toCompanion(bool nullToAbsent) {
    return FavoriteMealCompanion(
      idMeal: Value(idMeal),
      strMeal: Value(strMeal),
      strDrinkAlternate: Value(strDrinkAlternate),
      strCategory: Value(strCategory),
      strArea: Value(strArea),
      strInstructions: Value(strInstructions),
      strMealThumb: Value(strMealThumb),
    );
  }

  factory FavoriteMealData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteMealData(
      idMeal: serializer.fromJson<String>(json['idMeal']),
      strMeal: serializer.fromJson<String>(json['strMeal']),
      strDrinkAlternate: serializer.fromJson<String>(json['strDrinkAlternate']),
      strCategory: serializer.fromJson<String>(json['strCategory']),
      strArea: serializer.fromJson<String>(json['strArea']),
      strInstructions: serializer.fromJson<String>(json['strInstructions']),
      strMealThumb: serializer.fromJson<String>(json['strMealThumb']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMeal': serializer.toJson<String>(idMeal),
      'strMeal': serializer.toJson<String>(strMeal),
      'strDrinkAlternate': serializer.toJson<String>(strDrinkAlternate),
      'strCategory': serializer.toJson<String>(strCategory),
      'strArea': serializer.toJson<String>(strArea),
      'strInstructions': serializer.toJson<String>(strInstructions),
      'strMealThumb': serializer.toJson<String>(strMealThumb),
    };
  }

  FavoriteMealData copyWith(
          {String? idMeal,
          String? strMeal,
          String? strDrinkAlternate,
          String? strCategory,
          String? strArea,
          String? strInstructions,
          String? strMealThumb}) =>
      FavoriteMealData(
        idMeal: idMeal ?? this.idMeal,
        strMeal: strMeal ?? this.strMeal,
        strDrinkAlternate: strDrinkAlternate ?? this.strDrinkAlternate,
        strCategory: strCategory ?? this.strCategory,
        strArea: strArea ?? this.strArea,
        strInstructions: strInstructions ?? this.strInstructions,
        strMealThumb: strMealThumb ?? this.strMealThumb,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteMealData(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strDrinkAlternate: $strDrinkAlternate, ')
          ..write('strCategory: $strCategory, ')
          ..write('strArea: $strArea, ')
          ..write('strInstructions: $strInstructions, ')
          ..write('strMealThumb: $strMealThumb')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idMeal, strMeal, strDrinkAlternate,
      strCategory, strArea, strInstructions, strMealThumb);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteMealData &&
          other.idMeal == this.idMeal &&
          other.strMeal == this.strMeal &&
          other.strDrinkAlternate == this.strDrinkAlternate &&
          other.strCategory == this.strCategory &&
          other.strArea == this.strArea &&
          other.strInstructions == this.strInstructions &&
          other.strMealThumb == this.strMealThumb);
}

class FavoriteMealCompanion extends UpdateCompanion<FavoriteMealData> {
  final Value<String> idMeal;
  final Value<String> strMeal;
  final Value<String> strDrinkAlternate;
  final Value<String> strCategory;
  final Value<String> strArea;
  final Value<String> strInstructions;
  final Value<String> strMealThumb;
  const FavoriteMealCompanion({
    this.idMeal = const Value.absent(),
    this.strMeal = const Value.absent(),
    this.strDrinkAlternate = const Value.absent(),
    this.strCategory = const Value.absent(),
    this.strArea = const Value.absent(),
    this.strInstructions = const Value.absent(),
    this.strMealThumb = const Value.absent(),
  });
  FavoriteMealCompanion.insert({
    required String idMeal,
    required String strMeal,
    required String strDrinkAlternate,
    required String strCategory,
    required String strArea,
    required String strInstructions,
    required String strMealThumb,
  })  : idMeal = Value(idMeal),
        strMeal = Value(strMeal),
        strDrinkAlternate = Value(strDrinkAlternate),
        strCategory = Value(strCategory),
        strArea = Value(strArea),
        strInstructions = Value(strInstructions),
        strMealThumb = Value(strMealThumb);
  static Insertable<FavoriteMealData> custom({
    Expression<String>? idMeal,
    Expression<String>? strMeal,
    Expression<String>? strDrinkAlternate,
    Expression<String>? strCategory,
    Expression<String>? strArea,
    Expression<String>? strInstructions,
    Expression<String>? strMealThumb,
  }) {
    return RawValuesInsertable({
      if (idMeal != null) 'id_meal': idMeal,
      if (strMeal != null) 'str_meal': strMeal,
      if (strDrinkAlternate != null) 'str_drink_alternate': strDrinkAlternate,
      if (strCategory != null) 'str_category': strCategory,
      if (strArea != null) 'str_area': strArea,
      if (strInstructions != null) 'str_instructions': strInstructions,
      if (strMealThumb != null) 'str_meal_thumb': strMealThumb,
    });
  }

  FavoriteMealCompanion copyWith(
      {Value<String>? idMeal,
      Value<String>? strMeal,
      Value<String>? strDrinkAlternate,
      Value<String>? strCategory,
      Value<String>? strArea,
      Value<String>? strInstructions,
      Value<String>? strMealThumb}) {
    return FavoriteMealCompanion(
      idMeal: idMeal ?? this.idMeal,
      strMeal: strMeal ?? this.strMeal,
      strDrinkAlternate: strDrinkAlternate ?? this.strDrinkAlternate,
      strCategory: strCategory ?? this.strCategory,
      strArea: strArea ?? this.strArea,
      strInstructions: strInstructions ?? this.strInstructions,
      strMealThumb: strMealThumb ?? this.strMealThumb,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMeal.present) {
      map['id_meal'] = Variable<String>(idMeal.value);
    }
    if (strMeal.present) {
      map['str_meal'] = Variable<String>(strMeal.value);
    }
    if (strDrinkAlternate.present) {
      map['str_drink_alternate'] = Variable<String>(strDrinkAlternate.value);
    }
    if (strCategory.present) {
      map['str_category'] = Variable<String>(strCategory.value);
    }
    if (strArea.present) {
      map['str_area'] = Variable<String>(strArea.value);
    }
    if (strInstructions.present) {
      map['str_instructions'] = Variable<String>(strInstructions.value);
    }
    if (strMealThumb.present) {
      map['str_meal_thumb'] = Variable<String>(strMealThumb.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteMealCompanion(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strDrinkAlternate: $strDrinkAlternate, ')
          ..write('strCategory: $strCategory, ')
          ..write('strArea: $strArea, ')
          ..write('strInstructions: $strInstructions, ')
          ..write('strMealThumb: $strMealThumb')
          ..write(')'))
        .toString();
  }
}

class $FavoriteMealTable extends FavoriteMeal
    with TableInfo<$FavoriteMealTable, FavoriteMealData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteMealTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  @override
  late final GeneratedColumn<String?> idMeal = GeneratedColumn<String?>(
      'id_meal', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _strMealMeta = const VerificationMeta('strMeal');
  @override
  late final GeneratedColumn<String?> strMeal = GeneratedColumn<String?>(
      'str_meal', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _strDrinkAlternateMeta =
      const VerificationMeta('strDrinkAlternate');
  @override
  late final GeneratedColumn<String?> strDrinkAlternate =
      GeneratedColumn<String?>('str_drink_alternate', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _strCategoryMeta =
      const VerificationMeta('strCategory');
  @override
  late final GeneratedColumn<String?> strCategory = GeneratedColumn<String?>(
      'str_category', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _strAreaMeta = const VerificationMeta('strArea');
  @override
  late final GeneratedColumn<String?> strArea = GeneratedColumn<String?>(
      'str_area', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _strInstructionsMeta =
      const VerificationMeta('strInstructions');
  @override
  late final GeneratedColumn<String?> strInstructions =
      GeneratedColumn<String?>('str_instructions', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _strMealThumbMeta =
      const VerificationMeta('strMealThumb');
  @override
  late final GeneratedColumn<String?> strMealThumb = GeneratedColumn<String?>(
      'str_meal_thumb', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        idMeal,
        strMeal,
        strDrinkAlternate,
        strCategory,
        strArea,
        strInstructions,
        strMealThumb
      ];
  @override
  String get aliasedName => _alias ?? 'favorite_meal';
  @override
  String get actualTableName => 'favorite_meal';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteMealData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_meal')) {
      context.handle(_idMealMeta,
          idMeal.isAcceptableOrUnknown(data['id_meal']!, _idMealMeta));
    } else if (isInserting) {
      context.missing(_idMealMeta);
    }
    if (data.containsKey('str_meal')) {
      context.handle(_strMealMeta,
          strMeal.isAcceptableOrUnknown(data['str_meal']!, _strMealMeta));
    } else if (isInserting) {
      context.missing(_strMealMeta);
    }
    if (data.containsKey('str_drink_alternate')) {
      context.handle(
          _strDrinkAlternateMeta,
          strDrinkAlternate.isAcceptableOrUnknown(
              data['str_drink_alternate']!, _strDrinkAlternateMeta));
    } else if (isInserting) {
      context.missing(_strDrinkAlternateMeta);
    }
    if (data.containsKey('str_category')) {
      context.handle(
          _strCategoryMeta,
          strCategory.isAcceptableOrUnknown(
              data['str_category']!, _strCategoryMeta));
    } else if (isInserting) {
      context.missing(_strCategoryMeta);
    }
    if (data.containsKey('str_area')) {
      context.handle(_strAreaMeta,
          strArea.isAcceptableOrUnknown(data['str_area']!, _strAreaMeta));
    } else if (isInserting) {
      context.missing(_strAreaMeta);
    }
    if (data.containsKey('str_instructions')) {
      context.handle(
          _strInstructionsMeta,
          strInstructions.isAcceptableOrUnknown(
              data['str_instructions']!, _strInstructionsMeta));
    } else if (isInserting) {
      context.missing(_strInstructionsMeta);
    }
    if (data.containsKey('str_meal_thumb')) {
      context.handle(
          _strMealThumbMeta,
          strMealThumb.isAcceptableOrUnknown(
              data['str_meal_thumb']!, _strMealThumbMeta));
    } else if (isInserting) {
      context.missing(_strMealThumbMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  FavoriteMealData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FavoriteMealData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FavoriteMealTable createAlias(String alias) {
    return $FavoriteMealTable(attachedDatabase, alias);
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $FavoriteMealTable favoriteMeal = $FavoriteMealTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteMeal];
}
