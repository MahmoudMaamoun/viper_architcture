//
//  UniversityModel.swift
//  viper_architecture
//
//  Created by Mahmoud Maamoun on 02/05/2024.
//

import Foundation
class University:Codable {
   
    let domains: [String]
       let stateProvince: String?
       let name: String
       let webPages: [String]
       let country: Country
       let alphaTwoCode: AlphaTwoCode

       enum CodingKeys: String, CodingKey {
           case domains
           case stateProvince = "state-province"
           case name
           case webPages = "web_pages"
           case country
           case alphaTwoCode = "alpha_two_code"
       }
    
}
enum AlphaTwoCode: String, Codable {
    case ae = "AE"
}

enum Country: String, Codable {
    case unitedArabEmirates = "United Arab Emirates"
}


struct UniversityViewModel {
    var universityName:String
    var universityState:String?
    
    init(university: University) {
        self.universityName = university.name
        self.universityState = university.stateProvince
    }
}
