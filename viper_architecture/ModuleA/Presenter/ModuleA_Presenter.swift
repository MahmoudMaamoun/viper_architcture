//
//  ModuleAPresenter.swift
//  viper_architecture
//
//  Created by Mahmoud Maamoun on 02/05/2024.
//

import Foundation

class ModuleA_Presenter : ModuleAPresenterProtocol,ModuleOutputInterpreterProtocol {
   
    //MARK: - PROPERTIES
    var view:ModuleAViewProtocol?
    private let interactor:ModuleAInteractorInputProtocol
    private let router:ModuleA_Router
    private var universityList = [University]()
    var numOfRows: Int { return universityList.count}
    
    //MARK: - FUNCTIONS
    init(view: ModuleAViewProtocol, interactor: ModuleAInteractorInputProtocol, router: ModuleA_Router) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
    //MARK: - PERSENTER DELEGATE METHODS
    func viewDidLoad() {
        view?.showLoading()
        interactor.getUniversityList()
    }
    func configureCell(cell: UniversityCellView, indexPath: IndexPath) {
        let uniObj = universityList[indexPath.row]
        let cellVM = UniversityViewModel(university: uniObj)

        cell.configureCell(With: cellVM)
    }
    
    
    //MARK: - INTERACTOR OUTPUT DELEGATE METHODS
    func universitiesFetchedSuccessfully(univiersities: [University]) {
        view?.hidelLoading()
        self.universityList = univiersities
        view?.reloadData()
    }
    func universitiesFaildToFetch(withError error: any Error) {
        view?.hidelLoading()
        // SHOW ERROR
    }
}
