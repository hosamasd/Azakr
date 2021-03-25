//
//  AzkarModek.swift
//  Azakr
//
//  Created by hosam on 3/25/21.
//

import SwiftUI

struct AzkarModek:Decodable,Identifiable {
    //    var id = UUID().uuidString
    //    var category,reference,zekr,description,count:String
    
    //    let category, count, welcomeDescription: String
    //    let zekr,reference: String
    //
    //    enum CodingKeys: String, CodingKey {
    //        case welcomeDescription = "description"
    //        case reference, zekr,count,category
    //    }
    var id = UUID().uuidString
    
    let category : String
    let count : String?
    let descriptionField : String?
    let reference : String?
    let zekr : String?
    
    enum CodingKeys: String, CodingKey {
        case category = "category"
        case count = "count"
        case descriptionField = "description"
        case reference = "reference"
        case zekr = "zekr"
    }
}


