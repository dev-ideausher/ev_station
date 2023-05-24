class GetAllCars {
  final bool? status;
  final String? message;
  final int? results;
  final List<Cars>? cars;

  GetAllCars({
    this.status,
    this.message,
    this.results,
    this.cars,
  });

  GetAllCars.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        results = json['results'] as int?,
        cars = (json['cars'] as List?)
            ?.map((dynamic e) => Cars.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'results': results,
        'cars': cars?.map((e) => e.toJson()).toList()
      };
}

class Cars {
  final String? id;
  final String? user;
  final String? name;
  final String? modelName;
  final List<String>? images;
  final String? chassisNumber;
  final String? chargerType;
  final String? chargerCapacity;
  final String? currentType;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;

  Cars({
    this.id,
    this.user,
    this.name,
    this.modelName,
    this.images,
    this.chassisNumber,
    this.chargerType,
    this.chargerCapacity,
    this.currentType,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  Cars.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        user = json['user'] as String?,
        name = json['name'] as String?,
        modelName = json['modelName'] as String?,
        images =
            (json['images'] as List?)?.map((dynamic e) => e as String).toList(),
        chassisNumber = json['chassisNumber'] as String?,
        chargerType = json['chargerType'] as String?,
        chargerCapacity = json['chargerCapacity'] as String?,
        currentType = json['currentType'] as String?,
        isDeleted = json['isDeleted'] as bool?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user': user,
        'name': name,
        'modelName': modelName,
        'images': images,
        'chassisNumber': chassisNumber,
        'chargerType': chargerType,
        'chargerCapacity': chargerCapacity,
        'currentType': currentType,
        'isDeleted': isDeleted,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
