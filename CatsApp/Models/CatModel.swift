//
//  CatModel.swift
//  CatsApp
//
//  Created by Abdulkerim Can on 4.09.2023.
//

import Foundation

struct CatModel: Codable {
    let name: String?
    let origin: String?
    let description: String?
    let lifeSpan: String?
    let referenceImageId: String?


    enum CodingKeys: String, CodingKey {
        case name
        case origin
        case description
        case lifeSpan = "life_span"
        case referenceImageId = "reference_image_id"
        
    }
    var _name : String {
        name ?? "N/A"
    }
    var _origin: String {
        origin ?? "N/A"
    }
    var _description: String {
        description ?? "N/A"
    }
    var _lifeSpan: String {
        lifeSpan ?? "N/A"
    }
    var _referenceImageId: String {
        referenceImageId ?? ""
    }
}


