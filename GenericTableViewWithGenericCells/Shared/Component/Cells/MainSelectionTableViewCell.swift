//
//  MainSelectionTableViewCell.swift
//  GenericTableViewWithGenericCells
//
//  Created by De La Cruz, Eduardo on 04/03/2019.
//  Copyright © 2019 De La Cruz, Eduardo. All rights reserved.
//

import UIKit

class MainSelectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainSelectionImageView: UIImageView!
    @IBOutlet weak var mainSelectionTitleLabel: UILabel!

    func config(model: MainSelectionModel) {
        mainSelectionTitleLabel.text = model.title
        mainSelectionImageView.image = UIImage(named: model.image)
    }
}
