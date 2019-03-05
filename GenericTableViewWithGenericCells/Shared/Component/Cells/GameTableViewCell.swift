//
//  GameTableViewCell.swift
//  GenericTableViewWithGenericCells
//
//  Created by De La Cruz, Eduardo on 04/03/2019.
//  Copyright © 2019 De La Cruz, Eduardo. All rights reserved.
//

import UIKit

final class GameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var gameReleaseDateLabel: UILabel!
    @IBOutlet weak var gameImageView: UIImageView!
    
    func config(model: GameModel) {
        gameNameLabel.text = model.gameName
        gameReleaseDateLabel.text = model.gameReleaseDate
        gameImageView.image = UIImage(named: model.gameImage)
    }
}
