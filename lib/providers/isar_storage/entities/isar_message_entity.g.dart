// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_message_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarMessageEntityCollection on Isar {
  IsarCollection<IsarMessageEntity> get isarMessageEntitys => this.collection();
}

const IsarMessageEntitySchema = CollectionSchema(
  name: r'IsarMessageEntity',
  id: 3632493539182600996,
  properties: {
    r'appointment': PropertySchema(
      id: 0,
      name: r'appointment',
      type: IsarType.object,
      target: r'Appointment',
    ),
    r'deletedAt': PropertySchema(
      id: 1,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'package': PropertySchema(
      id: 2,
      name: r'package',
      type: IsarType.object,
      target: r'SubscriptionPackage',
    ),
    r'photos': PropertySchema(
      id: 3,
      name: r'photos',
      type: IsarType.stringList,
    ),
    r'text': PropertySchema(
      id: 4,
      name: r'text',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 5,
      name: r'type',
      type: IsarType.byte,
      enumMap: _IsarMessageEntitytypeEnumValueMap,
    )
  },
  estimateSize: _isarMessageEntityEstimateSize,
  serialize: _isarMessageEntitySerialize,
  deserialize: _isarMessageEntityDeserialize,
  deserializeProp: _isarMessageEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'room': LinkSchema(
      id: -194908948596935644,
      name: r'room',
      target: r'IsarChatRoomEntity',
      single: true,
      linkName: r'messages',
    ),
    r'owner': LinkSchema(
      id: -4908615155690482555,
      name: r'owner',
      target: r'IsarUserEntity',
      single: true,
    )
  },
  embeddedSchemas: {
    r'SubscriptionPackage': SubscriptionPackageSchema,
    r'Appointment': AppointmentSchema,
    r'AvailableDate': AvailableDateSchema
  },
  getId: _isarMessageEntityGetId,
  getLinks: _isarMessageEntityGetLinks,
  attach: _isarMessageEntityAttach,
  version: '3.1.0+1',
);

int _isarMessageEntityEstimateSize(
  IsarMessageEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.appointment;
    if (value != null) {
      bytesCount += 3 +
          AppointmentSchema.estimateSize(
              value, allOffsets[Appointment]!, allOffsets);
    }
  }
  {
    final value = object.package;
    if (value != null) {
      bytesCount += 3 +
          SubscriptionPackageSchema.estimateSize(
              value, allOffsets[SubscriptionPackage]!, allOffsets);
    }
  }
  {
    final list = object.photos;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.text;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarMessageEntitySerialize(
  IsarMessageEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Appointment>(
    offsets[0],
    allOffsets,
    AppointmentSchema.serialize,
    object.appointment,
  );
  writer.writeDateTime(offsets[1], object.deletedAt);
  writer.writeObject<SubscriptionPackage>(
    offsets[2],
    allOffsets,
    SubscriptionPackageSchema.serialize,
    object.package,
  );
  writer.writeStringList(offsets[3], object.photos);
  writer.writeString(offsets[4], object.text);
  writer.writeByte(offsets[5], object.type.index);
}

IsarMessageEntity _isarMessageEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarMessageEntity();
  object.appointment = reader.readObjectOrNull<Appointment>(
    offsets[0],
    AppointmentSchema.deserialize,
    allOffsets,
  );
  object.deletedAt = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.package = reader.readObjectOrNull<SubscriptionPackage>(
    offsets[2],
    SubscriptionPackageSchema.deserialize,
    allOffsets,
  );
  object.photos = reader.readStringList(offsets[3]);
  object.text = reader.readStringOrNull(offsets[4]);
  object.type =
      _IsarMessageEntitytypeValueEnumMap[reader.readByteOrNull(offsets[5])] ??
          MessageType.basic;
  return object;
}

P _isarMessageEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Appointment>(
        offset,
        AppointmentSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<SubscriptionPackage>(
        offset,
        SubscriptionPackageSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readStringList(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (_IsarMessageEntitytypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          MessageType.basic) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarMessageEntitytypeEnumValueMap = {
  'basic': 0,
  'photo': 1,
  'subscription': 2,
  'appointment': 3,
  'unsupported': 4,
};
const _IsarMessageEntitytypeValueEnumMap = {
  0: MessageType.basic,
  1: MessageType.photo,
  2: MessageType.subscription,
  3: MessageType.appointment,
  4: MessageType.unsupported,
};

Id _isarMessageEntityGetId(IsarMessageEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarMessageEntityGetLinks(
    IsarMessageEntity object) {
  return [object.room, object.owner];
}

void _isarMessageEntityAttach(
    IsarCollection<dynamic> col, Id id, IsarMessageEntity object) {
  object.id = id;
  object.room
      .attach(col, col.isar.collection<IsarChatRoomEntity>(), r'room', id);
  object.owner.attach(col, col.isar.collection<IsarUserEntity>(), r'owner', id);
}

extension IsarMessageEntityQueryWhereSort
    on QueryBuilder<IsarMessageEntity, IsarMessageEntity, QWhere> {
  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarMessageEntityQueryWhere
    on QueryBuilder<IsarMessageEntity, IsarMessageEntity, QWhereClause> {
  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarMessageEntityQueryFilter
    on QueryBuilder<IsarMessageEntity, IsarMessageEntity, QFilterCondition> {
  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      appointmentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'appointment',
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      appointmentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'appointment',
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      deletedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      deletedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      deletedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deletedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      packageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'package',
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      packageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'package',
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photos',
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photos',
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photos',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photos',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photos',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      photosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      textIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      textIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      textEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      textGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      textLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      textBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      textContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      textMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      typeEqualTo(MessageType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      typeGreaterThan(
    MessageType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      typeLessThan(
    MessageType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      typeBetween(
    MessageType lower,
    MessageType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarMessageEntityQueryObject
    on QueryBuilder<IsarMessageEntity, IsarMessageEntity, QFilterCondition> {
  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      appointment(FilterQuery<Appointment> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'appointment');
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      package(FilterQuery<SubscriptionPackage> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'package');
    });
  }
}

extension IsarMessageEntityQueryLinks
    on QueryBuilder<IsarMessageEntity, IsarMessageEntity, QFilterCondition> {
  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      room(FilterQuery<IsarChatRoomEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'room');
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      roomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'room', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      owner(FilterQuery<IsarUserEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'owner');
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterFilterCondition>
      ownerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'owner', 0, true, 0, true);
    });
  }
}

extension IsarMessageEntityQuerySortBy
    on QueryBuilder<IsarMessageEntity, IsarMessageEntity, QSortBy> {
  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterSortBy>
      sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterSortBy>
      sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension IsarMessageEntityQuerySortThenBy
    on QueryBuilder<IsarMessageEntity, IsarMessageEntity, QSortThenBy> {
  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterSortBy>
      thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterSortBy>
      thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension IsarMessageEntityQueryWhereDistinct
    on QueryBuilder<IsarMessageEntity, IsarMessageEntity, QDistinct> {
  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QDistinct>
      distinctByPhotos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photos');
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QDistinct> distinctByText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarMessageEntity, IsarMessageEntity, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }
}

extension IsarMessageEntityQueryProperty
    on QueryBuilder<IsarMessageEntity, IsarMessageEntity, QQueryProperty> {
  QueryBuilder<IsarMessageEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarMessageEntity, Appointment?, QQueryOperations>
      appointmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appointment');
    });
  }

  QueryBuilder<IsarMessageEntity, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<IsarMessageEntity, SubscriptionPackage?, QQueryOperations>
      packageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'package');
    });
  }

  QueryBuilder<IsarMessageEntity, List<String>?, QQueryOperations>
      photosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photos');
    });
  }

  QueryBuilder<IsarMessageEntity, String?, QQueryOperations> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }

  QueryBuilder<IsarMessageEntity, MessageType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SubscriptionPackageSchema = Schema(
  name: r'SubscriptionPackage',
  id: 7687732856327313764,
  properties: {
    r'imageUrl': PropertySchema(
      id: 0,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'isPurchased': PropertySchema(
      id: 1,
      name: r'isPurchased',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _subscriptionPackageEstimateSize,
  serialize: _subscriptionPackageSerialize,
  deserialize: _subscriptionPackageDeserialize,
  deserializeProp: _subscriptionPackageDeserializeProp,
);

int _subscriptionPackageEstimateSize(
  SubscriptionPackage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.imageUrl.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _subscriptionPackageSerialize(
  SubscriptionPackage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.imageUrl);
  writer.writeBool(offsets[1], object.isPurchased);
  writer.writeString(offsets[2], object.name);
}

SubscriptionPackage _subscriptionPackageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SubscriptionPackage();
  object.imageUrl = reader.readString(offsets[0]);
  object.isPurchased = reader.readBool(offsets[1]);
  object.name = reader.readString(offsets[2]);
  return object;
}

P _subscriptionPackageDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SubscriptionPackageQueryFilter on QueryBuilder<SubscriptionPackage,
    SubscriptionPackage, QFilterCondition> {
  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      imageUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      imageUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      imageUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      imageUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      imageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      imageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      isPurchasedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPurchased',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionPackage, SubscriptionPackage, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension SubscriptionPackageQueryObject on QueryBuilder<SubscriptionPackage,
    SubscriptionPackage, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AppointmentSchema = Schema(
  name: r'Appointment',
  id: 2680450406379222733,
  properties: {
    r'availableDates': PropertySchema(
      id: 0,
      name: r'availableDates',
      type: IsarType.objectList,
      target: r'AvailableDate',
    ),
    r'packageName': PropertySchema(
      id: 1,
      name: r'packageName',
      type: IsarType.string,
    ),
    r'selectedDate': PropertySchema(
      id: 2,
      name: r'selectedDate',
      type: IsarType.object,
      target: r'AvailableDate',
    )
  },
  estimateSize: _appointmentEstimateSize,
  serialize: _appointmentSerialize,
  deserialize: _appointmentDeserialize,
  deserializeProp: _appointmentDeserializeProp,
);

int _appointmentEstimateSize(
  Appointment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.availableDates.length * 3;
  {
    final offsets = allOffsets[AvailableDate]!;
    for (var i = 0; i < object.availableDates.length; i++) {
      final value = object.availableDates[i];
      bytesCount +=
          AvailableDateSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.packageName.length * 3;
  {
    final value = object.selectedDate;
    if (value != null) {
      bytesCount += 3 +
          AvailableDateSchema.estimateSize(
              value, allOffsets[AvailableDate]!, allOffsets);
    }
  }
  return bytesCount;
}

void _appointmentSerialize(
  Appointment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<AvailableDate>(
    offsets[0],
    allOffsets,
    AvailableDateSchema.serialize,
    object.availableDates,
  );
  writer.writeString(offsets[1], object.packageName);
  writer.writeObject<AvailableDate>(
    offsets[2],
    allOffsets,
    AvailableDateSchema.serialize,
    object.selectedDate,
  );
}

Appointment _appointmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Appointment();
  object.availableDates = reader.readObjectList<AvailableDate>(
        offsets[0],
        AvailableDateSchema.deserialize,
        allOffsets,
        AvailableDate(),
      ) ??
      [];
  object.packageName = reader.readString(offsets[1]);
  object.selectedDate = reader.readObjectOrNull<AvailableDate>(
    offsets[2],
    AvailableDateSchema.deserialize,
    allOffsets,
  );
  return object;
}

P _appointmentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<AvailableDate>(
            offset,
            AvailableDateSchema.deserialize,
            allOffsets,
            AvailableDate(),
          ) ??
          []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<AvailableDate>(
        offset,
        AvailableDateSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AppointmentQueryFilter
    on QueryBuilder<Appointment, Appointment, QFilterCondition> {
  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      availableDatesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableDates',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      availableDatesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableDates',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      availableDatesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableDates',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      availableDatesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableDates',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      availableDatesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableDates',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      availableDatesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'availableDates',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      packageNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      packageNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      packageNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      packageNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packageName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      packageNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      packageNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      packageNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      packageNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'packageName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      packageNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packageName',
        value: '',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      packageNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'packageName',
        value: '',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      selectedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'selectedDate',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      selectedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'selectedDate',
      ));
    });
  }
}

extension AppointmentQueryObject
    on QueryBuilder<Appointment, Appointment, QFilterCondition> {
  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      availableDatesElement(FilterQuery<AvailableDate> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'availableDates');
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition> selectedDate(
      FilterQuery<AvailableDate> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'selectedDate');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AvailableDateSchema = Schema(
  name: r'AvailableDate',
  id: -9094719584209771205,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'time': PropertySchema(
      id: 1,
      name: r'time',
      type: IsarType.byte,
      enumMap: _AvailableDatetimeEnumValueMap,
    )
  },
  estimateSize: _availableDateEstimateSize,
  serialize: _availableDateSerialize,
  deserialize: _availableDateDeserialize,
  deserializeProp: _availableDateDeserializeProp,
);

int _availableDateEstimateSize(
  AvailableDate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _availableDateSerialize(
  AvailableDate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeByte(offsets[1], object.time.index);
}

AvailableDate _availableDateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AvailableDate();
  object.date = reader.readDateTime(offsets[0]);
  object.time =
      _AvailableDatetimeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
          Time.morning;
  return object;
}

P _availableDateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (_AvailableDatetimeValueEnumMap[reader.readByteOrNull(offset)] ??
          Time.morning) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AvailableDatetimeEnumValueMap = {
  'morning': 0,
  'afternoon': 1,
  'custom': 2,
};
const _AvailableDatetimeValueEnumMap = {
  0: Time.morning,
  1: Time.afternoon,
  2: Time.custom,
};

extension AvailableDateQueryFilter
    on QueryBuilder<AvailableDate, AvailableDate, QFilterCondition> {
  QueryBuilder<AvailableDate, AvailableDate, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<AvailableDate, AvailableDate, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<AvailableDate, AvailableDate, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<AvailableDate, AvailableDate, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AvailableDate, AvailableDate, QAfterFilterCondition> timeEqualTo(
      Time value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<AvailableDate, AvailableDate, QAfterFilterCondition>
      timeGreaterThan(
    Time value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<AvailableDate, AvailableDate, QAfterFilterCondition>
      timeLessThan(
    Time value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<AvailableDate, AvailableDate, QAfterFilterCondition> timeBetween(
    Time lower,
    Time upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AvailableDateQueryObject
    on QueryBuilder<AvailableDate, AvailableDate, QFilterCondition> {}
