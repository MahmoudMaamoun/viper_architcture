//
//  ModuleAListViewController.swift
//  viper_architecture
//
//  Created by Mahmoud Maamoun on 02/05/2024.
//

import Foundation
import UIKit

class ModuleA_ListViewController : UIViewController,ModuleAViewProtocol {
    
    //MARK: - PROPERTIES
    @IBOutlet weak var tbView: UITableView!
    
    var moduleAPresenter: ModuleA_Presenter!
    var presenter:ModuleAPresenterProtocol!
    private var loadingIndicatior : UIActivityIndicatorView!
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    //MARK: - VIEW PROTOCOL
    func showLoading() {
        DispatchQueue.main.async {
            self.loadingIndicatior = UIActivityIndicatorView(style: .large)
            self.view.addSubview(self.loadingIndicatior)
            self.loadingIndicatior.startAnimating()
            self.view.isUserInteractionEnabled = false
        }
    }
    
    func hidelLoading() {
        DispatchQueue.main.async {
            self.loadingIndicatior.removeFromSuperview()
            self.view.isUserInteractionEnabled = true
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tbView.reloadData()
        }
    }
}
//MARK: - UITABLE VIEW DATASOURCE

extension ModuleA_ListViewController : UITableViewDataSource 
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UniversityCellView
        presenter.configureCell(cell: cell, indexPath: indexPath)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
}

extension ModuleA_ListViewController : UITableViewDelegate {
    
     func tableView(_ tableView: UITableView,heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
