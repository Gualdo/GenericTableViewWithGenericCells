//
//  MovieModel.swift
//  GenericTableViewWithGenericCells
//
//  Created by De La Cruz, Eduardo on 05/03/2019.
//  Copyright © 2019 De La Cruz, Eduardo. All rights reserved.
//

import Foundation

struct MovieModel: DescriptiveProtocol {
    var title: String
    var releaseYear: String
    var image: String
    var artistsArray: [String]
    var descriptor: CellDescriptor {
        let cellDescriptor = CellDescriptor { (cell: MovieTableViewCell) in
            cell.config(model: self)
        }
        return cellDescriptor
    }
}
