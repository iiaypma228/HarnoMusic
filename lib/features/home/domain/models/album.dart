import 'package:garno_music/common/models/json_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'album.g.dart';

@JsonSerializable()
class Album implements IJsonModel<Album> {
  Album(
      {required this.id,
      required this.name,
      required this.artistId,
      required this.artistName,
      required this.imageUrl});

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  final int id;
  final String name;
  final int artistId;
  final String artistName;
  final String imageUrl;

  @override
  Album fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
