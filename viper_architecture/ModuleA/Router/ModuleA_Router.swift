//
//  ModuleARouter.swift
//  viper_architecture
//
//  Created by Mahmoud Maamoun on 02/05/2024.
//

import UIKit

class ModuleA_Router : RouterProtocol {
    var moduleaVC:ModuleA_ListViewController?
    
   static func createModule() -> UIViewController {
       let sb = UIStoryboard(name: "ModuleA", bundle: nil)
       let view = sb.instantiateViewController(identifier: "ModuleA_ListViewController") as! ModuleA_ListViewController
       
       let interactor = ModuleA_Interactor()
       let router = ModuleA_Router()
       let presenter = ModuleA_Presenter(view: view, interactor: interactor, router: router)
       
       view.presenter = presenter
       interactor.moduleAPresenter = presenter
       router.moduleaVC = view
       
       return view
    }
}
