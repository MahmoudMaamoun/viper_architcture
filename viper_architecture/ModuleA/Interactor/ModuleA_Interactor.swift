//
//  ModuleAInteractor.swift
//  viper_architecture
//
//  Created by Mahmoud Maamoun on 02/05/2024.
//

import Foundation

class ModuleA_Interactor : ModuleAInteractorInputProtocol {
  
    //MARK: - PROPERTIES
    var moduleAPresenter : ModuleA_Presenter?
    private let moduleAServices = ModuleAServices()
    
    //MARK: - INTERACTOR INPUT DELEGATE METHODS
    func getUniversityList() {
        moduleAServices.getUnivsities { universities,error in
            if let univirsities = universities {
                self.moduleAPresenter?.universitiesFetchedSuccessfully(univiersities: univirsities)
            } else if let error = error {
                self.moduleAPresenter?.universitiesFaildToFetch(withError: error)
            }
        }
    }
    
}
