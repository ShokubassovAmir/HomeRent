//
//  RestApi.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/27/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import Foundation
import Moya

public enum RestApi{
    case postUser(name:String,phone:String,password:String,verificationID:String)
    case getAparts
    case getUser(phone:String,password:String)
    case searchAps(textSearch:String)
    case getMyFavoutites(apartment:String,userId:UInt64)
    case postFavour(apatmentId:UInt64,userId:UInt64)
    case getIsFavour(apartment:String,apartmentId:UInt64,userId:UInt64)
    case deleteFavour(apartmentId:UInt64)
    case getNews
    case patchInfo(id:UInt64,name:String,phone:String,img:String)
    case postFeedback(id:UInt64,message:String,date:String)
    case getOrderForAp(apartmentId:UInt64)
    case postOrder(apartmentId:UInt64,userId:UInt64,dateFrom:String,dateTo:String)
    case getMyAps(apartment:String,userId:UInt64, dateFrom:String)
    case getMyArchive(apartment:String,userId:UInt64,dateTo:String)
    case delOrder(id:UInt64)
    case filter(sort:String,fromPrice:UInt64,toPrice:UInt64,rooms:UInt64,order:String,type:String,city:String,isHot:String)
}

extension RestApi:TargetType{
    public var baseURL: URL {
        return URL(string: "http://127.0.0.1:3000")!
    }
    
    public var path: String {
        switch self {
        case .postUser:
            return "/users"
        case .getAparts:
            return "/apartments"
        case .getUser:
            return "/users"
        case .searchAps:
            return "/apartments"
        case .getMyFavoutites:
            return "/favorites"
        case .postFavour:
            return "/favorites"
        case .getIsFavour:
            return "/favorites"
        case .deleteFavour(let apartmentId):
            return "/favorites/\(apartmentId)"
        case .getNews:
            return "/news"
        case .patchInfo(let id, let name, let phone,let img):
            return "/users/\(id)"
        case .postFeedback:
            return "/feedbacks"
        case .getOrderForAp(let apartmentId):
            return "/orders"
        
        case .postOrder(let apartmentId, let userId,let dateFrom, let dateTo):
            return "/orders"
            
        case .getMyAps(let apartment,let userId,let dateFrom):
            return "/orders"
        case .getMyArchive(let apartment,let userId,let dateTo):
            return "/orders"
        case .delOrder(let id):
            return "/orders/\(id)"
        case .filter:
            return "/apartments"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .postUser, .postFavour, .postFeedback, .postOrder:
            return .post
        case .getAparts,.getUser,.searchAps,.getMyFavoutites, .getIsFavour, .getNews, .getOrderForAp, .getMyAps, .getMyArchive, .filter:
            return .get
        
        case .patchInfo:
            return .patch
            
        case .deleteFavour, .delOrder:
            return .delete
        
        }
        
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .postUser(let name, let phone, let password,let verificationID):
            return .requestParameters(parameters: [
                "name":"\(name)",
                "phone":"\(phone)",
                "password":"\(password)",
                "verificationID":"\(verificationID)"],
                encoding: JSONEncoding.default)
        case .getUser(let phone,let password):
            return .requestParameters(parameters: [
                "phone":"\(phone)",
                "password":"\(password)"],
                encoding: URLEncoding.default)
        case .searchAps(let textSearch):
            return .requestParameters(parameters: [
                "q":"\(textSearch)"],
                encoding: URLEncoding.default)
        case .getMyFavoutites(let apartment, let userId):
            return .requestParameters(parameters: [
                "_expand":"\(apartment)",
                "userId":"\(userId)"],
                encoding: URLEncoding.default)
        case .postFavour(let apatmentId, let userId):
        return .requestParameters(parameters: [
            "apartmentId":apatmentId,
            "userId":userId],
            encoding: JSONEncoding.default)
            
        case .getIsFavour(let apartment,let apartmentId,let userId):
        return .requestParameters(parameters: [
            "_expand":"\(apartment)",
            "apartmentId":"\(apartmentId)",
            "userId":"\(userId)"],
            encoding: URLEncoding.default)
            
        case .patchInfo(let id, let name,let phone,let img):
        return .requestParameters(parameters: [
            "name":"\(name)",
            "phone":"\(phone)",
            "imageUrl":"\(img)"],
            encoding: JSONEncoding.default)
            
        case .postFeedback(let id, let message,let date):
            return .requestParameters(parameters: [
            "userId":"\(id)",
            "message":message,
            "datePosted":date],
            encoding: JSONEncoding.default)
            
        case .getOrderForAp(let apartmentId):
        return .requestParameters(parameters: [
            "apartmentId":"\(apartmentId)"],
            encoding: URLEncoding.default)
            
            
        case .postOrder(let apartmentId,let userId,let dateFrom,let dateTo):
        return .requestParameters(parameters: [
            "apartmentId":"\(apartmentId)",
            "userId":"\(userId)",
            "dateFrom":dateFrom,
            "dateTo":dateTo],
            encoding: JSONEncoding.default)
            
        case .getMyAps(let apartment,let userId,let dateFrom):
        return .requestParameters(parameters: [
            "_expand":apartment,
            "userId":"\(userId)",
            "dateFrom_gte":dateFrom],
            encoding: URLEncoding.default)
            
            
        case .getMyArchive(let apartment, let userId, let dateTo):
        return .requestParameters(parameters: [
            "_expand":apartment,
            "userId":"\(userId)",
            "dateTo_lte":dateTo],
            encoding: URLEncoding.default)
        case .filter(let sort,let fromPrice,let toPrice,let rooms,let order, let type,let city,let isHot):
        return .requestParameters(parameters: [
            "_sort":sort,
            "price_gte":fromPrice,
            "price_lte":toPrice,
            "rooms":rooms,
            "_order":"\(order)",
            "type":"\(type)",
            "city":"\(city)",
            "isHot":isHot],
            encoding: URLEncoding.default)
        default:
            return .requestPlain
            
        
        }
        
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}

struct VerbosePlugin: PluginType {
    let verbose: Bool

    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        #if DEBUG
        if let body = request.httpBody,
           let str = String(data: body, encoding: .utf8) {
            print("request to send: \(str))")
        }
        #endif
        return request
    }
}



