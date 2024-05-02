//
//  ModuleAServices.swift
//  viper_architecture
//
//  Created by Mahmoud Maamoun on 02/05/2024.
//

import Foundation

class ModuleAServices {
    //MARK: PROPERTIES
    let networkLayer = NetworkLayer()
    
    //MARK: FUNCTIONS
    func getUnivsities(completionHandler:@escaping ([University]? , Error?) -> ()) {
        let url = URL(string: Constants.UNIVERSITIES_URL)!
        networkLayer.get(url: url, responseType: [University].self) { result in
            switch result {
            case .success(let universities):
                print("Fetched universities: \(universities)")
                completionHandler(universities,nil)
            case .failure(let error):
                print("Error: \(error)")
                completionHandler(nil,error)
            }
        }
        
    }
}
