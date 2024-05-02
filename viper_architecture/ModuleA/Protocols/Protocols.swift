//
//  Protocols.swift
//  viper_architecture
//
//  Created by Mahmoud Maamoun on 02/05/2024.
//

import Foundation


// MARK: - PERESENTER PROTOCOL
protocol ModuleAPresenterProtocol {
    var view:ModuleAViewProtocol? {get set}
    var numOfRows:Int {get}
    func viewDidLoad()
    func configureCell(cell:UniversityCellView,indexPath:IndexPath)
}
//MARK: - INTERPRETER PROTOCOL
protocol ModuleAInteractorInputProtocol {
    func getUniversityList()
   
}
//MARK: - INTERPRETER OUTPUT PROTOCOL
protocol ModuleOutputInterpreterProtocol {
    func universitiesFetchedSuccessfully(univiersities:[University])
    func universitiesFaildToFetch(withError error:Error)
}
//MARK: - VIEW PROTOCOLE
protocol ModuleAViewProtocol {
    var moduleAPresenter:ModuleA_Presenter! {get set}
    func showLoading()
    func hidelLoading()
    func reloadData()
}
//MARK: - ROUTER PROTOCOL
protocol RouterProtocol {
    
}
