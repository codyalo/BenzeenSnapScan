//flutter with api/json example
/*
import 'dart:convert';

Post postFromJson(String str) {
    final jsonData = json.decode(str);
    return Post.fromJson(jsonData);
}

String postToJson(Post data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Post {
    int userId;
    int id;
    String title;
    String body;

    Post({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    factory Post.fromJson(Map<String, dynamic> json) => new Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
*/


//our stuff
import 'dart:convert';

Post postFromJson(String str) {
    final jsonData = json.decode(str);
    return Post.fromJson(jsonData);
}

String postToJson(Post data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Post {
    String roNum;
    int modelYear;
    String modelName;
    String partName;
    String invNum;
    String stockNum;
    String rating;
    String location;
    String notes;
    int images;

    Post({
        this.roNum,
        this.modelYear,
        this.modelName,
        this.partName,
        this.invNum,
        this.stockNum,
        this.rating,
        this.location,
        this.notes,
        this.images,
    });

    factory Post.fromJson(Map<String, dynamic> json) => new Post(
        roNum: json["RoNumber"],
        modelYear: json["ModelYear"],
        modelName: json["ModelName"],
        partName: json["PartName"],
        invNum: json["InventoryNumber"],
        stockNum: json["StockTicketNumber"],
        rating: json["PartRating"],
        location: json["LocationCode"],
        notes: json["PartNotes"],
        images: json["TotalImage"],
    );

    Map<String, dynamic> toJson() => {
        "RoNumber": roNum,
        "ModelYear": modelYear,
        "ModelName": modelName,
        "PartName": partName,
        "InventoryNumber": invNum,
        "StockTicketNumber": stockNum,
        "PartRating": rating,
        "LocationCode": location,
        "PartNotes": notes,
        "TotalImage": images,
    };
}
