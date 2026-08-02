// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_entry.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMediaEntryCollection on Isar {
  IsarCollection<MediaEntry> get mediaEntrys => this.collection();
}

const MediaEntrySchema = CollectionSchema(
  name: r'MediaEntry',
  id: -154034820896071616,
  properties: {
    r'addedDate': PropertySchema(
      id: 0,
      name: r'addedDate',
      type: IsarType.dateTime,
    ),
    r'anilistId': PropertySchema(
      id: 1,
      name: r'anilistId',
      type: IsarType.long,
    ),
    r'averageScore': PropertySchema(
      id: 2,
      name: r'averageScore',
      type: IsarType.long,
    ),
    r'bannerImage': PropertySchema(
      id: 3,
      name: r'bannerImage',
      type: IsarType.string,
    ),
    r'countryOfOrigin': PropertySchema(
      id: 4,
      name: r'countryOfOrigin',
      type: IsarType.string,
    ),
    r'coverImage': PropertySchema(
      id: 5,
      name: r'coverImage',
      type: IsarType.string,
    ),
    r'currentChapter': PropertySchema(
      id: 6,
      name: r'currentChapter',
      type: IsarType.long,
    ),
    r'currentEpisode': PropertySchema(
      id: 7,
      name: r'currentEpisode',
      type: IsarType.long,
    ),
    r'currentVolume': PropertySchema(
      id: 8,
      name: r'currentVolume',
      type: IsarType.long,
    ),
    r'dirty': PropertySchema(id: 9, name: r'dirty', type: IsarType.bool),
    r'episodeDuration': PropertySchema(
      id: 10,
      name: r'episodeDuration',
      type: IsarType.long,
    ),
    r'favorite': PropertySchema(id: 11, name: r'favorite', type: IsarType.bool),
    r'format': PropertySchema(id: 12, name: r'format', type: IsarType.string),
    r'franchiseId': PropertySchema(
      id: 13,
      name: r'franchiseId',
      type: IsarType.string,
    ),
    r'genres': PropertySchema(
      id: 14,
      name: r'genres',
      type: IsarType.stringList,
    ),
    r'hasUnaddedRelations': PropertySchema(
      id: 15,
      name: r'hasUnaddedRelations',
      type: IsarType.bool,
    ),
    r'lastSyncedAt': PropertySchema(
      id: 16,
      name: r'lastSyncedAt',
      type: IsarType.dateTime,
    ),
    r'lastUpdatedDate': PropertySchema(
      id: 17,
      name: r'lastUpdatedDate',
      type: IsarType.dateTime,
    ),
    r'malId': PropertySchema(id: 18, name: r'malId', type: IsarType.long),
    r'notes': PropertySchema(id: 19, name: r'notes', type: IsarType.string),
    r'publisher': PropertySchema(
      id: 20,
      name: r'publisher',
      type: IsarType.string,
    ),
    r'relationToRoot': PropertySchema(
      id: 21,
      name: r'relationToRoot',
      type: IsarType.string,
    ),
    r'releaseStatus': PropertySchema(
      id: 22,
      name: r'releaseStatus',
      type: IsarType.string,
    ),
    r'remoteUpdatedAt': PropertySchema(
      id: 23,
      name: r'remoteUpdatedAt',
      type: IsarType.long,
    ),
    r'startDate': PropertySchema(
      id: 24,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 25,
      name: r'status',
      type: IsarType.byte,
      enumMap: _MediaEntrystatusEnumValueMap,
    ),
    r'studio': PropertySchema(id: 26, name: r'studio', type: IsarType.string),
    r'synopsis': PropertySchema(
      id: 27,
      name: r'synopsis',
      type: IsarType.string,
    ),
    r'title': PropertySchema(id: 28, name: r'title', type: IsarType.string),
    r'titleEnglish': PropertySchema(
      id: 29,
      name: r'titleEnglish',
      type: IsarType.string,
    ),
    r'titleOriginal': PropertySchema(
      id: 30,
      name: r'titleOriginal',
      type: IsarType.string,
    ),
    r'totalChapters': PropertySchema(
      id: 31,
      name: r'totalChapters',
      type: IsarType.long,
    ),
    r'totalEpisodes': PropertySchema(
      id: 32,
      name: r'totalEpisodes',
      type: IsarType.long,
    ),
    r'totalVolumes': PropertySchema(
      id: 33,
      name: r'totalVolumes',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 34,
      name: r'type',
      type: IsarType.byte,
      enumMap: _MediaEntrytypeEnumValueMap,
    ),
    r'userRating': PropertySchema(
      id: 35,
      name: r'userRating',
      type: IsarType.double,
    ),
    r'uuid': PropertySchema(id: 36, name: r'uuid', type: IsarType.string),
    r'year': PropertySchema(id: 37, name: r'year', type: IsarType.long),
  },

  estimateSize: _mediaEntryEstimateSize,
  serialize: _mediaEntrySerialize,
  deserialize: _mediaEntryDeserialize,
  deserializeProp: _mediaEntryDeserializeProp,
  idName: r'id',
  indexes: {
    r'type': IndexSchema(
      id: 5117122708147080838,
      name: r'type',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'type',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'status': IndexSchema(
      id: -107785170620420283,
      name: r'status',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'status',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'title': IndexSchema(
      id: -7636685945352118059,
      name: r'title',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'title',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'uuid': IndexSchema(
      id: 2134397340427724972,
      name: r'uuid',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'uuid',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'franchiseId': IndexSchema(
      id: -5468503384453974098,
      name: r'franchiseId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'franchiseId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _mediaEntryGetId,
  getLinks: _mediaEntryGetLinks,
  attach: _mediaEntryAttach,
  version: '3.3.2',
);

int _mediaEntryEstimateSize(
  MediaEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bannerImage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.countryOfOrigin;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.coverImage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.format;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.franchiseId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.genres.length * 3;
  {
    for (var i = 0; i < object.genres.length; i++) {
      final value = object.genres[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.publisher;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.relationToRoot;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.releaseStatus;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.studio;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.synopsis;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  {
    final value = object.titleEnglish;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.titleOriginal;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.uuid.length * 3;
  return bytesCount;
}

void _mediaEntrySerialize(
  MediaEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.addedDate);
  writer.writeLong(offsets[1], object.anilistId);
  writer.writeLong(offsets[2], object.averageScore);
  writer.writeString(offsets[3], object.bannerImage);
  writer.writeString(offsets[4], object.countryOfOrigin);
  writer.writeString(offsets[5], object.coverImage);
  writer.writeLong(offsets[6], object.currentChapter);
  writer.writeLong(offsets[7], object.currentEpisode);
  writer.writeLong(offsets[8], object.currentVolume);
  writer.writeBool(offsets[9], object.dirty);
  writer.writeLong(offsets[10], object.episodeDuration);
  writer.writeBool(offsets[11], object.favorite);
  writer.writeString(offsets[12], object.format);
  writer.writeString(offsets[13], object.franchiseId);
  writer.writeStringList(offsets[14], object.genres);
  writer.writeBool(offsets[15], object.hasUnaddedRelations);
  writer.writeDateTime(offsets[16], object.lastSyncedAt);
  writer.writeDateTime(offsets[17], object.lastUpdatedDate);
  writer.writeLong(offsets[18], object.malId);
  writer.writeString(offsets[19], object.notes);
  writer.writeString(offsets[20], object.publisher);
  writer.writeString(offsets[21], object.relationToRoot);
  writer.writeString(offsets[22], object.releaseStatus);
  writer.writeLong(offsets[23], object.remoteUpdatedAt);
  writer.writeDateTime(offsets[24], object.startDate);
  writer.writeByte(offsets[25], object.status.index);
  writer.writeString(offsets[26], object.studio);
  writer.writeString(offsets[27], object.synopsis);
  writer.writeString(offsets[28], object.title);
  writer.writeString(offsets[29], object.titleEnglish);
  writer.writeString(offsets[30], object.titleOriginal);
  writer.writeLong(offsets[31], object.totalChapters);
  writer.writeLong(offsets[32], object.totalEpisodes);
  writer.writeLong(offsets[33], object.totalVolumes);
  writer.writeByte(offsets[34], object.type.index);
  writer.writeDouble(offsets[35], object.userRating);
  writer.writeString(offsets[36], object.uuid);
  writer.writeLong(offsets[37], object.year);
}

MediaEntry _mediaEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MediaEntry(
    anilistId: reader.readLongOrNull(offsets[1]),
    averageScore: reader.readLongOrNull(offsets[2]),
    bannerImage: reader.readStringOrNull(offsets[3]),
    countryOfOrigin: reader.readStringOrNull(offsets[4]),
    coverImage: reader.readStringOrNull(offsets[5]),
    currentChapter: reader.readLongOrNull(offsets[6]) ?? 0,
    currentEpisode: reader.readLongOrNull(offsets[7]) ?? 0,
    currentVolume: reader.readLongOrNull(offsets[8]) ?? 0,
    episodeDuration: reader.readLongOrNull(offsets[10]),
    favorite: reader.readBoolOrNull(offsets[11]) ?? false,
    format: reader.readStringOrNull(offsets[12]),
    genres: reader.readStringList(offsets[14]) ?? const [],
    lastUpdatedDate: reader.readDateTimeOrNull(offsets[17]),
    malId: reader.readLongOrNull(offsets[18]),
    notes: reader.readStringOrNull(offsets[19]),
    publisher: reader.readStringOrNull(offsets[20]),
    releaseStatus: reader.readStringOrNull(offsets[22]),
    startDate: reader.readDateTimeOrNull(offsets[24]),
    status:
        _MediaEntrystatusValueEnumMap[reader.readByteOrNull(offsets[25])] ??
        MediaStatus.pending,
    studio: reader.readStringOrNull(offsets[26]),
    synopsis: reader.readStringOrNull(offsets[27]),
    title: reader.readStringOrNull(offsets[28]) ?? '',
    titleEnglish: reader.readStringOrNull(offsets[29]),
    titleOriginal: reader.readStringOrNull(offsets[30]),
    totalChapters: reader.readLongOrNull(offsets[31]),
    totalEpisodes: reader.readLongOrNull(offsets[32]),
    totalVolumes: reader.readLongOrNull(offsets[33]),
    type:
        _MediaEntrytypeValueEnumMap[reader.readByteOrNull(offsets[34])] ??
        MediaType.anime,
    userRating: reader.readDoubleOrNull(offsets[35]),
    year: reader.readLongOrNull(offsets[37]),
  );
  object.addedDate = reader.readDateTime(offsets[0]);
  object.dirty = reader.readBool(offsets[9]);
  object.franchiseId = reader.readStringOrNull(offsets[13]);
  object.hasUnaddedRelations = reader.readBool(offsets[15]);
  object.id = id;
  object.lastSyncedAt = reader.readDateTimeOrNull(offsets[16]);
  object.relationToRoot = reader.readStringOrNull(offsets[21]);
  object.remoteUpdatedAt = reader.readLongOrNull(offsets[23]);
  object.uuid = reader.readString(offsets[36]);
  return object;
}

P _mediaEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 7:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 8:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringList(offset) ?? const []) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 18:
      return (reader.readLongOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readLongOrNull(offset)) as P;
    case 24:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 25:
      return (_MediaEntrystatusValueEnumMap[reader.readByteOrNull(offset)] ??
              MediaStatus.pending)
          as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (reader.readStringOrNull(offset)) as P;
    case 28:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 29:
      return (reader.readStringOrNull(offset)) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    case 31:
      return (reader.readLongOrNull(offset)) as P;
    case 32:
      return (reader.readLongOrNull(offset)) as P;
    case 33:
      return (reader.readLongOrNull(offset)) as P;
    case 34:
      return (_MediaEntrytypeValueEnumMap[reader.readByteOrNull(offset)] ??
              MediaType.anime)
          as P;
    case 35:
      return (reader.readDoubleOrNull(offset)) as P;
    case 36:
      return (reader.readString(offset)) as P;
    case 37:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MediaEntrystatusEnumValueMap = {
  'pending': 0,
  'watching': 1,
  'completed': 2,
  'paused': 3,
  'dropped': 4,
};
const _MediaEntrystatusValueEnumMap = {
  0: MediaStatus.pending,
  1: MediaStatus.watching,
  2: MediaStatus.completed,
  3: MediaStatus.paused,
  4: MediaStatus.dropped,
};
const _MediaEntrytypeEnumValueMap = {
  'anime': 0,
  'manga': 1,
  'manhwa': 2,
  'manhua': 3,
};
const _MediaEntrytypeValueEnumMap = {
  0: MediaType.anime,
  1: MediaType.manga,
  2: MediaType.manhwa,
  3: MediaType.manhua,
};

Id _mediaEntryGetId(MediaEntry object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mediaEntryGetLinks(MediaEntry object) {
  return [];
}

void _mediaEntryAttach(IsarCollection<dynamic> col, Id id, MediaEntry object) {
  object.id = id;
}

extension MediaEntryByIndex on IsarCollection<MediaEntry> {
  Future<MediaEntry?> getByUuid(String uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  MediaEntry? getByUuidSync(String uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<MediaEntry?>> getAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<MediaEntry?> getAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uuid', values);
  }

  Future<int> deleteAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uuid', values);
  }

  int deleteAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uuid', values);
  }

  Future<Id> putByUuid(MediaEntry object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(MediaEntry object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<MediaEntry> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<MediaEntry> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension MediaEntryQueryWhereSort
    on QueryBuilder<MediaEntry, MediaEntry, QWhere> {
  QueryBuilder<MediaEntry, MediaEntry, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhere> anyType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'type'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhere> anyStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'status'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhere> anyTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'title'),
      );
    });
  }
}

extension MediaEntryQueryWhere
    on QueryBuilder<MediaEntry, MediaEntry, QWhereClause> {
  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> typeEqualTo(
    MediaType type,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'type', value: [type]),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> typeNotEqualTo(
    MediaType type,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'type',
                lower: [],
                upper: [type],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'type',
                lower: [type],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'type',
                lower: [type],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'type',
                lower: [],
                upper: [type],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> typeGreaterThan(
    MediaType type, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'type',
          lower: [type],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> typeLessThan(
    MediaType type, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'type',
          lower: [],
          upper: [type],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> typeBetween(
    MediaType lowerType,
    MediaType upperType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'type',
          lower: [lowerType],
          includeLower: includeLower,
          upper: [upperType],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> statusEqualTo(
    MediaStatus status,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'status', value: [status]),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> statusNotEqualTo(
    MediaStatus status,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [],
                upper: [status],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [status],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [status],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [],
                upper: [status],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> statusGreaterThan(
    MediaStatus status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'status',
          lower: [status],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> statusLessThan(
    MediaStatus status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'status',
          lower: [],
          upper: [status],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> statusBetween(
    MediaStatus lowerStatus,
    MediaStatus upperStatus, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'status',
          lower: [lowerStatus],
          includeLower: includeLower,
          upper: [upperStatus],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> titleEqualTo(
    String title,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'title', value: [title]),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> titleNotEqualTo(
    String title,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [],
                upper: [title],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [title],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [title],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [],
                upper: [title],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> titleGreaterThan(
    String title, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [title],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> titleLessThan(
    String title, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [],
          upper: [title],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> titleBetween(
    String lowerTitle,
    String upperTitle, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [lowerTitle],
          includeLower: includeLower,
          upper: [upperTitle],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> titleStartsWith(
    String TitlePrefix,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [TitlePrefix],
          upper: ['$TitlePrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'title', value: ['']),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'title', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'title', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'title', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'title', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> uuidEqualTo(
    String uuid,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'uuid', value: [uuid]),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> uuidNotEqualTo(
    String uuid,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'uuid',
                lower: [],
                upper: [uuid],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'uuid',
                lower: [uuid],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'uuid',
                lower: [uuid],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'uuid',
                lower: [],
                upper: [uuid],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> franchiseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'franchiseId', value: [null]),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause>
  franchiseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'franchiseId',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> franchiseIdEqualTo(
    String? franchiseId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'franchiseId',
          value: [franchiseId],
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterWhereClause> franchiseIdNotEqualTo(
    String? franchiseId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'franchiseId',
                lower: [],
                upper: [franchiseId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'franchiseId',
                lower: [franchiseId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'franchiseId',
                lower: [franchiseId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'franchiseId',
                lower: [],
                upper: [franchiseId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension MediaEntryQueryFilter
    on QueryBuilder<MediaEntry, MediaEntry, QFilterCondition> {
  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> addedDateEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'addedDate', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  addedDateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'addedDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> addedDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'addedDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> addedDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'addedDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  anilistIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'anilistId'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  anilistIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'anilistId'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> anilistIdEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'anilistId', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  anilistIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'anilistId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> anilistIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'anilistId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> anilistIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'anilistId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  averageScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'averageScore'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  averageScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'averageScore'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  averageScoreEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'averageScore', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  averageScoreGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'averageScore',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  averageScoreLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'averageScore',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  averageScoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'averageScore',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  bannerImageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'bannerImage'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  bannerImageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'bannerImage'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  bannerImageEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'bannerImage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  bannerImageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'bannerImage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  bannerImageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'bannerImage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  bannerImageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'bannerImage',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  bannerImageStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'bannerImage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  bannerImageEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'bannerImage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  bannerImageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'bannerImage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  bannerImageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'bannerImage',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  bannerImageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bannerImage', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  bannerImageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'bannerImage', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  countryOfOriginIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'countryOfOrigin'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  countryOfOriginIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'countryOfOrigin'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  countryOfOriginEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'countryOfOrigin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  countryOfOriginGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'countryOfOrigin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  countryOfOriginLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'countryOfOrigin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  countryOfOriginBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'countryOfOrigin',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  countryOfOriginStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'countryOfOrigin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  countryOfOriginEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'countryOfOrigin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  countryOfOriginContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'countryOfOrigin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  countryOfOriginMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'countryOfOrigin',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  countryOfOriginIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'countryOfOrigin', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  countryOfOriginIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'countryOfOrigin', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  coverImageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'coverImage'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  coverImageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'coverImage'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> coverImageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'coverImage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  coverImageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'coverImage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  coverImageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'coverImage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> coverImageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'coverImage',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  coverImageStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'coverImage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  coverImageEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'coverImage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  coverImageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'coverImage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> coverImageMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'coverImage',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  coverImageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'coverImage', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  coverImageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'coverImage', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  currentChapterEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'currentChapter', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  currentChapterGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'currentChapter',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  currentChapterLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'currentChapter',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  currentChapterBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'currentChapter',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  currentEpisodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'currentEpisode', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  currentEpisodeGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'currentEpisode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  currentEpisodeLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'currentEpisode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  currentEpisodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'currentEpisode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  currentVolumeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'currentVolume', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  currentVolumeGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'currentVolume',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  currentVolumeLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'currentVolume',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  currentVolumeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'currentVolume',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> dirtyEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dirty', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  episodeDurationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'episodeDuration'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  episodeDurationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'episodeDuration'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  episodeDurationEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'episodeDuration', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  episodeDurationGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'episodeDuration',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  episodeDurationLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'episodeDuration',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  episodeDurationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'episodeDuration',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> favoriteEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'favorite', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> formatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'format'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  formatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'format'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> formatEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'format',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> formatGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'format',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> formatLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'format',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> formatBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'format',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> formatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'format',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> formatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'format',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> formatContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'format',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> formatMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'format',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> formatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'format', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  formatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'format', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  franchiseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'franchiseId'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  franchiseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'franchiseId'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  franchiseIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'franchiseId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  franchiseIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'franchiseId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  franchiseIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'franchiseId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  franchiseIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'franchiseId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  franchiseIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'franchiseId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  franchiseIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'franchiseId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  franchiseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'franchiseId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  franchiseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'franchiseId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  franchiseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'franchiseId', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  franchiseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'franchiseId', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  genresElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'genres',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  genresElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'genres',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  genresElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'genres',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  genresElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'genres',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  genresElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'genres',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  genresElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'genres',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  genresElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'genres',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  genresElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'genres',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  genresElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'genres', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  genresElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'genres', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  genresLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'genres', length, true, length, true);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> genresIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'genres', 0, true, 0, true);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  genresIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'genres', 0, false, 999999, true);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  genresLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'genres', 0, true, length, include);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  genresLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'genres', length, include, 999999, true);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  genresLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  hasUnaddedRelationsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasUnaddedRelations', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  lastSyncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastSyncedAt'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  lastSyncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastSyncedAt'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  lastSyncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastSyncedAt', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  lastSyncedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastSyncedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  lastSyncedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastSyncedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  lastSyncedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastSyncedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  lastUpdatedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastUpdatedDate'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  lastUpdatedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastUpdatedDate'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  lastUpdatedDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUpdatedDate', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  lastUpdatedDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastUpdatedDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  lastUpdatedDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastUpdatedDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  lastUpdatedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastUpdatedDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> malIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'malId'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> malIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'malId'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> malIdEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'malId', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> malIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'malId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> malIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'malId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> malIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'malId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'notes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> notesContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> notesMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'notes',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  publisherIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'publisher'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  publisherIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'publisher'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> publisherEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'publisher',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  publisherGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'publisher',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> publisherLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'publisher',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> publisherBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'publisher',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  publisherStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'publisher',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> publisherEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'publisher',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> publisherContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'publisher',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> publisherMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'publisher',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  publisherIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'publisher', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  publisherIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'publisher', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  relationToRootIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'relationToRoot'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  relationToRootIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'relationToRoot'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  relationToRootEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'relationToRoot',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  relationToRootGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'relationToRoot',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  relationToRootLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'relationToRoot',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  relationToRootBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'relationToRoot',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  relationToRootStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'relationToRoot',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  relationToRootEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'relationToRoot',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  relationToRootContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'relationToRoot',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  relationToRootMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'relationToRoot',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  relationToRootIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'relationToRoot', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  relationToRootIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'relationToRoot', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  releaseStatusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'releaseStatus'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  releaseStatusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'releaseStatus'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  releaseStatusEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'releaseStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  releaseStatusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'releaseStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  releaseStatusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'releaseStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  releaseStatusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'releaseStatus',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  releaseStatusStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'releaseStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  releaseStatusEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'releaseStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  releaseStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'releaseStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  releaseStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'releaseStatus',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  releaseStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'releaseStatus', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  releaseStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'releaseStatus', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  remoteUpdatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'remoteUpdatedAt'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  remoteUpdatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'remoteUpdatedAt'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  remoteUpdatedAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'remoteUpdatedAt', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  remoteUpdatedAtGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'remoteUpdatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  remoteUpdatedAtLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'remoteUpdatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  remoteUpdatedAtBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'remoteUpdatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'startDate'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'startDate'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> startDateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startDate', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  startDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'startDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> startDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'startDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> startDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'startDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> statusEqualTo(
    MediaStatus value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> statusGreaterThan(
    MediaStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> statusLessThan(
    MediaStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> statusBetween(
    MediaStatus lower,
    MediaStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> studioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'studio'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  studioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'studio'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> studioEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'studio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> studioGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'studio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> studioLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'studio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> studioBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'studio',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> studioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'studio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> studioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'studio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> studioContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'studio',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> studioMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'studio',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> studioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'studio', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  studioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'studio', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> synopsisIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'synopsis'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  synopsisIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'synopsis'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> synopsisEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'synopsis',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  synopsisGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'synopsis',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> synopsisLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'synopsis',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> synopsisBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'synopsis',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  synopsisStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'synopsis',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> synopsisEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'synopsis',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> synopsisContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'synopsis',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> synopsisMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'synopsis',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  synopsisIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'synopsis', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  synopsisIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'synopsis', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> titleContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> titleMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleEnglishIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'titleEnglish'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleEnglishIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'titleEnglish'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleEnglishEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'titleEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleEnglishGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'titleEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleEnglishLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'titleEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleEnglishBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'titleEnglish',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleEnglishStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'titleEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleEnglishEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'titleEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleEnglishContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'titleEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleEnglishMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'titleEnglish',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleEnglishIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'titleEnglish', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleEnglishIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'titleEnglish', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleOriginalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'titleOriginal'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleOriginalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'titleOriginal'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleOriginalEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'titleOriginal',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleOriginalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'titleOriginal',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleOriginalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'titleOriginal',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleOriginalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'titleOriginal',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleOriginalStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'titleOriginal',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleOriginalEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'titleOriginal',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleOriginalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'titleOriginal',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleOriginalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'titleOriginal',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleOriginalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'titleOriginal', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  titleOriginalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'titleOriginal', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalChaptersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'totalChapters'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalChaptersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'totalChapters'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalChaptersEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalChapters', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalChaptersGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalChapters',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalChaptersLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalChapters',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalChaptersBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalChapters',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalEpisodesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'totalEpisodes'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalEpisodesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'totalEpisodes'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalEpisodesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalEpisodes', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalEpisodesGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalEpisodes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalEpisodesLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalEpisodes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalEpisodesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalEpisodes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalVolumesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'totalVolumes'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalVolumesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'totalVolumes'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalVolumesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalVolumes', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalVolumesGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalVolumes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalVolumesLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalVolumes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  totalVolumesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalVolumes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> typeEqualTo(
    MediaType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> typeGreaterThan(
    MediaType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'type',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> typeLessThan(
    MediaType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'type',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> typeBetween(
    MediaType lower,
    MediaType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'type',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  userRatingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'userRating'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  userRatingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'userRating'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> userRatingEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'userRating',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  userRatingGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userRating',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition>
  userRatingLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userRating',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> userRatingBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userRating',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> uuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> uuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> uuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> uuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'uuid',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> uuidContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> uuidMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'uuid',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'uuid', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'uuid', value: ''),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> yearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'year'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> yearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'year'),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> yearEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'year', value: value),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> yearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'year',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> yearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'year',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterFilterCondition> yearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'year',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MediaEntryQueryObject
    on QueryBuilder<MediaEntry, MediaEntry, QFilterCondition> {}

extension MediaEntryQueryLinks
    on QueryBuilder<MediaEntry, MediaEntry, QFilterCondition> {}

extension MediaEntryQuerySortBy
    on QueryBuilder<MediaEntry, MediaEntry, QSortBy> {
  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByAnilistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anilistId', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByAnilistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anilistId', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByAverageScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageScore', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByAverageScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageScore', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByBannerImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bannerImage', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByBannerImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bannerImage', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByCountryOfOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryOfOrigin', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  sortByCountryOfOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryOfOrigin', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByCoverImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImage', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByCoverImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImage', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByCurrentChapter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentChapter', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  sortByCurrentChapterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentChapter', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByCurrentEpisode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentEpisode', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  sortByCurrentEpisodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentEpisode', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByCurrentVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentVolume', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByCurrentVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentVolume', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dirty', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dirty', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByEpisodeDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeDuration', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  sortByEpisodeDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeDuration', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'favorite', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'favorite', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByFormat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'format', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByFormatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'format', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByFranchiseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'franchiseId', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByFranchiseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'franchiseId', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  sortByHasUnaddedRelations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasUnaddedRelations', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  sortByHasUnaddedRelationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasUnaddedRelations', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByLastUpdatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedDate', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  sortByLastUpdatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedDate', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByMalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'malId', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByMalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'malId', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByPublisher() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisher', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByPublisherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisher', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByRelationToRoot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relationToRoot', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  sortByRelationToRootDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relationToRoot', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByReleaseStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseStatus', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByReleaseStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseStatus', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByRemoteUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  sortByRemoteUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByStudio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studio', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByStudioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studio', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortBySynopsis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'synopsis', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortBySynopsisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'synopsis', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByTitleEnglish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEnglish', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByTitleEnglishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEnglish', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByTitleOriginal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleOriginal', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByTitleOriginalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleOriginal', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByTotalChapters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalChapters', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByTotalChaptersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalChapters', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByTotalEpisodes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEpisodes', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByTotalEpisodesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEpisodes', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByTotalVolumes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVolumes', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByTotalVolumesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVolumes', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByUserRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userRating', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByUserRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userRating', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension MediaEntryQuerySortThenBy
    on QueryBuilder<MediaEntry, MediaEntry, QSortThenBy> {
  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByAnilistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anilistId', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByAnilistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anilistId', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByAverageScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageScore', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByAverageScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageScore', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByBannerImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bannerImage', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByBannerImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bannerImage', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByCountryOfOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryOfOrigin', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  thenByCountryOfOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryOfOrigin', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByCoverImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImage', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByCoverImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImage', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByCurrentChapter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentChapter', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  thenByCurrentChapterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentChapter', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByCurrentEpisode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentEpisode', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  thenByCurrentEpisodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentEpisode', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByCurrentVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentVolume', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByCurrentVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentVolume', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dirty', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByDirtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dirty', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByEpisodeDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeDuration', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  thenByEpisodeDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeDuration', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'favorite', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'favorite', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByFormat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'format', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByFormatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'format', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByFranchiseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'franchiseId', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByFranchiseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'franchiseId', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  thenByHasUnaddedRelations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasUnaddedRelations', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  thenByHasUnaddedRelationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasUnaddedRelations', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByLastUpdatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedDate', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  thenByLastUpdatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedDate', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByMalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'malId', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByMalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'malId', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByPublisher() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisher', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByPublisherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publisher', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByRelationToRoot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relationToRoot', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  thenByRelationToRootDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relationToRoot', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByReleaseStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseStatus', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByReleaseStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseStatus', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByRemoteUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy>
  thenByRemoteUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByStudio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studio', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByStudioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studio', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenBySynopsis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'synopsis', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenBySynopsisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'synopsis', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByTitleEnglish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEnglish', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByTitleEnglishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEnglish', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByTitleOriginal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleOriginal', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByTitleOriginalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleOriginal', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByTotalChapters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalChapters', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByTotalChaptersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalChapters', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByTotalEpisodes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEpisodes', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByTotalEpisodesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEpisodes', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByTotalVolumes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVolumes', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByTotalVolumesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVolumes', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByUserRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userRating', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByUserRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userRating', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QAfterSortBy> thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension MediaEntryQueryWhereDistinct
    on QueryBuilder<MediaEntry, MediaEntry, QDistinct> {
  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedDate');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByAnilistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'anilistId');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByAverageScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageScore');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByBannerImage({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bannerImage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByCountryOfOrigin({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'countryOfOrigin',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByCoverImage({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverImage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByCurrentChapter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentChapter');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByCurrentEpisode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentEpisode');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByCurrentVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentVolume');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByDirty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dirty');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByEpisodeDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'episodeDuration');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'favorite');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByFormat({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'format', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByFranchiseId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'franchiseId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByGenres() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genres');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct>
  distinctByHasUnaddedRelations() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasUnaddedRelations');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncedAt');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByLastUpdatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdatedDate');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByMalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'malId');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByNotes({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByPublisher({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publisher', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByRelationToRoot({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'relationToRoot',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByReleaseStatus({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'releaseStatus',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByRemoteUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdatedAt');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByStudio({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studio', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctBySynopsis({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'synopsis', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByTitleEnglish({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titleEnglish', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByTitleOriginal({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'titleOriginal',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByTotalChapters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalChapters');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByTotalEpisodes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalEpisodes');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByTotalVolumes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalVolumes');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByUserRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userRating');
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByUuid({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaEntry, MediaEntry, QDistinct> distinctByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year');
    });
  }
}

extension MediaEntryQueryProperty
    on QueryBuilder<MediaEntry, MediaEntry, QQueryProperty> {
  QueryBuilder<MediaEntry, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MediaEntry, DateTime, QQueryOperations> addedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedDate');
    });
  }

  QueryBuilder<MediaEntry, int?, QQueryOperations> anilistIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'anilistId');
    });
  }

  QueryBuilder<MediaEntry, int?, QQueryOperations> averageScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageScore');
    });
  }

  QueryBuilder<MediaEntry, String?, QQueryOperations> bannerImageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bannerImage');
    });
  }

  QueryBuilder<MediaEntry, String?, QQueryOperations>
  countryOfOriginProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'countryOfOrigin');
    });
  }

  QueryBuilder<MediaEntry, String?, QQueryOperations> coverImageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverImage');
    });
  }

  QueryBuilder<MediaEntry, int, QQueryOperations> currentChapterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentChapter');
    });
  }

  QueryBuilder<MediaEntry, int, QQueryOperations> currentEpisodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentEpisode');
    });
  }

  QueryBuilder<MediaEntry, int, QQueryOperations> currentVolumeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentVolume');
    });
  }

  QueryBuilder<MediaEntry, bool, QQueryOperations> dirtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dirty');
    });
  }

  QueryBuilder<MediaEntry, int?, QQueryOperations> episodeDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'episodeDuration');
    });
  }

  QueryBuilder<MediaEntry, bool, QQueryOperations> favoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'favorite');
    });
  }

  QueryBuilder<MediaEntry, String?, QQueryOperations> formatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'format');
    });
  }

  QueryBuilder<MediaEntry, String?, QQueryOperations> franchiseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'franchiseId');
    });
  }

  QueryBuilder<MediaEntry, List<String>, QQueryOperations> genresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genres');
    });
  }

  QueryBuilder<MediaEntry, bool, QQueryOperations>
  hasUnaddedRelationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasUnaddedRelations');
    });
  }

  QueryBuilder<MediaEntry, DateTime?, QQueryOperations> lastSyncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncedAt');
    });
  }

  QueryBuilder<MediaEntry, DateTime?, QQueryOperations>
  lastUpdatedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdatedDate');
    });
  }

  QueryBuilder<MediaEntry, int?, QQueryOperations> malIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'malId');
    });
  }

  QueryBuilder<MediaEntry, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<MediaEntry, String?, QQueryOperations> publisherProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publisher');
    });
  }

  QueryBuilder<MediaEntry, String?, QQueryOperations> relationToRootProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'relationToRoot');
    });
  }

  QueryBuilder<MediaEntry, String?, QQueryOperations> releaseStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'releaseStatus');
    });
  }

  QueryBuilder<MediaEntry, int?, QQueryOperations> remoteUpdatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdatedAt');
    });
  }

  QueryBuilder<MediaEntry, DateTime?, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<MediaEntry, MediaStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<MediaEntry, String?, QQueryOperations> studioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studio');
    });
  }

  QueryBuilder<MediaEntry, String?, QQueryOperations> synopsisProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'synopsis');
    });
  }

  QueryBuilder<MediaEntry, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<MediaEntry, String?, QQueryOperations> titleEnglishProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleEnglish');
    });
  }

  QueryBuilder<MediaEntry, String?, QQueryOperations> titleOriginalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleOriginal');
    });
  }

  QueryBuilder<MediaEntry, int?, QQueryOperations> totalChaptersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalChapters');
    });
  }

  QueryBuilder<MediaEntry, int?, QQueryOperations> totalEpisodesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalEpisodes');
    });
  }

  QueryBuilder<MediaEntry, int?, QQueryOperations> totalVolumesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalVolumes');
    });
  }

  QueryBuilder<MediaEntry, MediaType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<MediaEntry, double?, QQueryOperations> userRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userRating');
    });
  }

  QueryBuilder<MediaEntry, String, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }

  QueryBuilder<MediaEntry, int?, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}
