//
//  UniversityCellView.swift
//  viper_architecture
//
//  Created by Mahmoud Maamoun on 02/05/2024.
//

import Foundation
import UIKit

class UniversityCellView : UITableViewCell
{
    @IBOutlet weak var universityName: UILabel!
    @IBOutlet weak var universityState: UILabel!
    
    func configureCell(With viewModel:UniversityViewModel) {
        universityName.text = viewModel.universityName
        universityState.text = viewModel.universityState
    }
    
}
