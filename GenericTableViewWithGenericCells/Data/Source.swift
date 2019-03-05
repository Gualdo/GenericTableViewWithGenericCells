//
//  Source.swift
//  GenericTableViewWithGenericCells
//
//  Created by De La Cruz, Eduardo on 05/03/2019.
//  Copyright © 2019 De La Cruz, Eduardo. All rights reserved.
//

import Foundation

final class Source {
    
    static let mainMenu = [
        MainSelectionModel(title: "Games", image: "GameIcon"),
        MainSelectionModel(title: "Movies", image: "MovieIcon"),
        MainSelectionModel(title: "Movies and games", image: "YingYang")
    ]
    
    static let games = [
        GameModel(gameName: "The Division", gameReleaseDate: "08/03/2016", gameImage: "TheDivision1"),
        GameModel(gameName: "The Division 2", gameReleaseDate: "15/03/2019", gameImage: "TheDivision2")
    ]

    static let movies = [
        MovieModel(title: "The Avengers 1", releaseYear: "27/04/2012", image: "Avengers1", artistsArray: ["Robert Downey Jr.", "Chris Hemsworth", "Mark Ruffalo", "Chris Evans"]),
        MovieModel(title: "The Avengers 2", releaseYear: "29/04/2015", image: "Avengers2", artistsArray: ["Robert Downey Jr.", "Chris Hemsworth", "Mark Ruffalo", "Chris Evans"])
    ]
    
    static let gamesAndMovies = [
        MoviesAndGames(name: "The Avengers 1", releaseDate: "27/04/2012", image: "Avengers1", actors: ["Robert Downey Jr.", "Chris Hemsworth", "Mark Ruffalo", "Chris Evans"]),
        MoviesAndGames(name: "The Division", releaseDate: "08/03/2016", image: "TheDivision1")
    ]
}
