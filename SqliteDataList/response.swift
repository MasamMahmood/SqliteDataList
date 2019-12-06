//
//  response.swift
//  SqliteDataList


import Foundation


struct SectionList : Codable {
    
    let title : String?
    var items : [Item]?
    
}

struct Item : Codable {
    
    let actionType : Int?
    let actionUrl : String?
    let bgColor : String?
    let booleanValue : Bool?
    var textField : String?
    var textValue : String?
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
    
    var sectionList : [SectionList]?
    
}

struct DataClass : Codable {

        let descriptionField : String?
        let engine : Int?
        let locationName : String?

        enum CodingKeys: String, CodingKey {
                case descriptionField = "description"
                case engine = "engine"
                case locationName = "location_name"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
                engine = try values.decodeIfPresent(Int.self, forKey: .engine)
                locationName = try values.decodeIfPresent(String.self, forKey: .locationName)
        }

}
