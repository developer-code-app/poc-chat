// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_chat_room_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarChatRoomEntityCollection on Isar {
  IsarCollection<IsarChatRoomEntity> get isarChatRoomEntitys =>
      this.collection();
}

const IsarChatRoomEntitySchema = CollectionSchema(
  name: r'ChatRoom',
  id: 3645375135519982771,
  properties: {},
  estimateSize: _isarChatRoomEntityEstimateSize,
  serialize: _isarChatRoomEntitySerialize,
  deserialize: _isarChatRoomEntityDeserialize,
  deserializeProp: _isarChatRoomEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'messages': LinkSchema(
      id: -1838734289672801517,
      name: r'messages',
      target: r'Message',
      single: false,
    ),
    r'members': LinkSchema(
      id: -1578615771921630991,
      name: r'members',
      target: r'User',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _isarChatRoomEntityGetId,
  getLinks: _isarChatRoomEntityGetLinks,
  attach: _isarChatRoomEntityAttach,
  version: '3.1.0+1',
);

int _isarChatRoomEntityEstimateSize(
  IsarChatRoomEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _isarChatRoomEntitySerialize(
  IsarChatRoomEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
IsarChatRoomEntity _isarChatRoomEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarChatRoomEntity();
  object.id = id;
  return object;
}

P _isarChatRoomEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarChatRoomEntityGetId(IsarChatRoomEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarChatRoomEntityGetLinks(
    IsarChatRoomEntity object) {
  return [object.messages, object.members];
}

void _isarChatRoomEntityAttach(
    IsarCollection<dynamic> col, Id id, IsarChatRoomEntity object) {
  object.id = id;
  object.messages
      .attach(col, col.isar.collection<IsarMessageEntity>(), r'messages', id);
  object.members
      .attach(col, col.isar.collection<IsarUserEntity>(), r'members', id);
}

extension IsarChatRoomEntityQueryWhereSort
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QWhere> {
  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarChatRoomEntityQueryWhere
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QWhereClause> {
  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterWhereClause>
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

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterWhereClause>
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

extension IsarChatRoomEntityQueryFilter
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QFilterCondition> {
  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
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
}

extension IsarChatRoomEntityQueryObject
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QFilterCondition> {}

extension IsarChatRoomEntityQueryLinks
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QFilterCondition> {
  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      messages(FilterQuery<IsarMessageEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'messages');
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      messagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'messages', length, true, length, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      messagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'messages', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      messagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'messages', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      messagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'messages', 0, true, length, include);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      messagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'messages', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      messagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'messages', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      members(FilterQuery<IsarUserEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'members');
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      membersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'members', length, true, length, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      membersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'members', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      membersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'members', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      membersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'members', 0, true, length, include);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      membersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'members', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterFilterCondition>
      membersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'members', lower, includeLower, upper, includeUpper);
    });
  }
}

extension IsarChatRoomEntityQuerySortBy
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QSortBy> {}

extension IsarChatRoomEntityQuerySortThenBy
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QSortThenBy> {
  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension IsarChatRoomEntityQueryWhereDistinct
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QDistinct> {}

extension IsarChatRoomEntityQueryProperty
    on QueryBuilder<IsarChatRoomEntity, IsarChatRoomEntity, QQueryProperty> {
  QueryBuilder<IsarChatRoomEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
