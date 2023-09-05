//
//  AppConstants.swift
//  CatsApp
//
//  Created by Abdulkerim Can on 4.09.2023.
//

import Foundation

enum AppConstants {
    
    static func url() -> String {
        "https://api.thecatapi.com/v1/breeds/"
    }
    static func imageUrl(id: String) -> String{
        "https://cdn2.thecatapi.com/images/\(id).jpg"
    }
}
