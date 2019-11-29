//
//  response.swift
//  SqliteDataList


import Foundation


struct SectionList : Codable {
    
    let title : String?
    let items : [Item]?
    
}

struct Item : Codable {
    
    let actionType : Int?
    let actionUrl : String?
    let bgColor : String?
    let booleanValue : Bool?
    let textField : String?
    let textValue : String?
    let unitId : Int?
    let latitude : Double?
    let longitude : Double?
    let actionParamData: String?
    let actionTitle: String?
    let pickList: [SectionList]?
    let multiSelect: Bool?
    let selectedValue: [String]?
    let version: Int?
    let masterId: Int?
    let itemValue: String?
}

struct Unit : Codable {
    
    let sectionList : [SectionList]?
    
}
