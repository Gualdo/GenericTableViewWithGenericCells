//
//  GameModel.swift
//  GenericTableViewWithGenericCells
//
//  Created by De La Cruz, Eduardo on 04/03/2019.
//  Copyright © 2019 De La Cruz, Eduardo. All rights reserved.
//

import Foundation

struct GameModel: DescriptiveProtocol {
    var gameName: String
    var gameReleaseDate: String
    var gameImage: String
    var descriptor: CellDescriptor {
        let cellDescriptor = CellDescriptor { (cell: GameTableViewCell) in
            cell.config(model: self)
        }
        
        return cellDescriptor
    }
}
