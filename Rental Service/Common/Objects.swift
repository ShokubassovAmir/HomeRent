//
//  Objects.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/27/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import Foundation
import ObjectMapper



public final class Apartments: NSObject, Mappable {
    var id: UInt64!
    var price:UInt64!
    var countrooms:UInt64!
    var address:String!
    var isHot:Bool!
    var img:[ImageUrl]!
    var type:String!
    var city:String!
    var owner:Owner!
    var datePosted:String!
    var latitude:Double!
    var longitude:Double!
    var bedPlaces:UInt64!
    var floor:UInt64!
    var descr:String!
    var comfort:[Comfort]!
    var name:String!
    public init?(map: Map) {
        super.init()
        self.mapping(map: map)
    }

    public  func mapping(map: Map){
        id          <- map["id"]
        price       <- map["price"]
        countrooms  <- map["rooms"]
        address     <- map["address"]
        isHot       <- map["isHot"]
        img         <- map["imageUrl"]
        type        <- map["type"]
        city        <- map["city"]
        owner       <- map["owner"]
        datePosted  <- map["datePosted"]
        latitude    <- map["latitude"]
        longitude   <- map["longitude"]
        bedPlaces   <- map["bedPlaces"]
        floor       <- map["floor"]
        descr       <- map["Description"]
        comfort <-  map["Comfort"]
        name    <-  map["name"]
        
        
    }
}

public final class ImageUrl:NSObject,Mappable{
    var id:UInt64!
    var urlImg:String!
    
    public init?(map: Map) {
        super.init()
        self.mapping(map: map)
    }
    
    public func mapping(map: Map) {
        id  <-  map["id"]
        urlImg   <-  map["url"]
    }
    
}


public final class Owner:NSObject,Mappable{
    var id:UInt64!
    var name:String!
    var phone:UInt64!
    
    public init?(map: Map) {
        super.init()
        self.mapping(map: map)
    }
    
    public func mapping(map: Map) {
        id  <-  map["id"]
        name   <-  map["name"]
        phone   <-  map["phone"]
    }
    
}



public final class Favorites:NSObject,Mappable{
    var id:UInt64!
    var apartmentId:UInt64!
    var apartment:Apartments!
    
    public init?(map: Map) {
        super.init()
        self.mapping(map: map)
    }
    
    public func mapping(map: Map) {
        id  <-  map["id"]
        apartmentId    <-  map["apartmentId"]
        apartment   <-  map["apartment"]
    }
    
}

public final class Comfort:NSObject,Mappable{
    var id:UInt64!
    var name:String!
    
    public init?(map: Map) {
        super.init()
        self.mapping(map: map)
    }
    
    public func mapping(map: Map) {
        id  <-  map["id"]
        name    <-  map["name"]
    }
    
}

public final class News:NSObject,Mappable{
    var id:UInt64!
    var content:String!
    
    public init?(map: Map) {
        super.init()
        self.mapping(map: map)
    }
    
    public func mapping(map: Map) {
        id  <-  map["id"]
        content    <-  map["content"]
    }
    
}


public final class Orders:NSObject,Mappable{
    var id:UInt64!
    var userId:UInt64!
    var apartmentId:UInt64!
    var dateFrom:String!
    var dateTo:String!
    var apartment:Apartments!
    
    public init?(map: Map) {
        super.init()
        self.mapping(map: map)
    }
    
    public func mapping(map: Map) {
        id  <-  map["id"]
        userId    <-  map["userId"]
        apartmentId    <-  map["apartmentId"]
        dateFrom    <-  map["dateFrom"]
        dateTo    <-  map["dateTo"]
        apartment   <-  map["apartment"]
    }
    
}






public final class User: NSObject, Mappable,NSCoding {
    var id: UInt64!
    var name:String!
    var phone:String!
    var password:String!
    var verificationID:String!
    var imageUrl:String!
    
    
    
    public init?(coder aDecoder: NSCoder) {
        if let id = aDecoder.decodeObject(forKey: "id") as? UInt64 {
            self.id = id
        }
        
        if let name = aDecoder.decodeObject(forKey: "name") as? String {
            self.name = name
        }
        
        if let phone = aDecoder.decodeObject(forKey: "phone") as? String {
            self.phone = phone
        }
        
        if let password = aDecoder.decodeObject(forKey: "password") as? String {
            self.password = password
        }
        if let verificationID = aDecoder.decodeObject(forKey: "verificationID") as? String {
            self.verificationID = verificationID
        }
        if let imageUrl = aDecoder.decodeObject(forKey: "imageUrl") as? String {
            self.imageUrl = imageUrl
        }
        
         
    }
    
    public func encode(with aCoder: NSCoder) {
        if let id = self.id {
            aCoder.encode(id, forKey: "id")
        }
        if let name = self.name {
            aCoder.encode(name, forKey: "name")
        }
        if let phone = self.phone {
            aCoder.encode(phone, forKey: "phone")
        }
        if let password = self.password {
            aCoder.encode(password, forKey: "password")
        }
        if let verificationID = self.verificationID {
            aCoder.encode(verificationID, forKey: "verificationID")
        }
        
        if let imageUrl = self.imageUrl {
            aCoder.encode(imageUrl, forKey: "imageUrl")
        }
        
    }
    
    
    
    
    public init?(map: Map) {
        super.init()
        self.mapping(map: map)
    }

    public  func mapping(map: Map){
        id          <- map["id"]
        name       <- map["name"]
        phone       <- map["phone"]
        password       <- map["password"]
        verificationID <-  map["verificationID"]
        imageUrl <-  map["imageUrl"]
        
    }
}
