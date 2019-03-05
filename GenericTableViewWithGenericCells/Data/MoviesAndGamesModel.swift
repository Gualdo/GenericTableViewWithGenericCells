//
//  MoviesAndGames.swift
//  GenericTableViewWithGenericCells
//
//  Created by De La Cruz, Eduardo on 05/03/2019.
//  Copyright © 2019 De La Cruz, Eduardo. All rights reserved.
//

import Foundation

struct MoviesAndGamesModel: DescriptiveProtocol {
    var name: String
    var releaseDate: String
    var image: String
    var actors: [String]?
    
    init(name: String, releaseDate: String, image: String, actors: [String]? = nil) {
        self.name = name
        self.releaseDate = releaseDate
        self.image = image
        self.actors = actors
    }
    
    var descriptor: CellDescriptor {
        if let actors = actors {
            let cellDescriptor = CellDescriptor { (cell: MovieTableViewCell) in
            cell.config(model: MovieModel(title: self.name, releaseYear: self.releaseDate, image: self.image, artistsArray: actors) )
            }
             return cellDescriptor
        } else {
            let cellDescriptor = CellDescriptor { (cell: GameTableViewCell) in
                cell.config(model: GameModel(gameName: self.name, gameReleaseDate: self.releaseDate, gameImage: self.image))
            }
             return cellDescriptor
        }
    }
}
