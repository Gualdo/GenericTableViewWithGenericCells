//
//  Navigator.swift
//  GenericTableViewWithGenericCells
//
//  Created by De La Cruz, Eduardo on 05/03/2019.
//  Copyright © 2019 De La Cruz, Eduardo. All rights reserved.
//

import UIKit

enum Segue {
    case home(source: [[MainSelectionModel]])
    case games(source: [[GameModel]])
    case movies(source: [[MovieModel]])
    case gamesAndMovies(source: [[MoviesAndGamesModel]])
    case error
}

final class Navigator {
    
    var sectionViewsArray:[SectionViews]? = [SectionViews]()
    var viewsForMoviesSection: [UIView] = [UIView]()
    var viewsForGameSection: [UIView] = [UIView]()
    var viewsForMoviesAndGamesSection: [UIView] = [UIView]()
    
    func show(segue: Segue, sender: UIViewController) {
        switch segue {
        case .home(let source):
            let homeViewController = GenericTableViewController(source: source, title: "Menu")
            homeViewController.didSelect = goToScreen(sender: homeViewController)
            show(target: homeViewController, sender: sender)
        case .games(let source):
            let vc = GenericTableViewController(source: source, title: "Games", sectionHeaderViews: sectionViewsArray != nil ? viewsForGameSection : nil)
            show(target: vc, sender: sender)
        case .movies(let source):
            let vc = GenericTableViewController(source: source, title: "Movies", sectionHeaderViews: sectionViewsArray != nil ? viewsForMoviesSection : nil)
            show(target: vc, sender: sender)
        case .gamesAndMovies(let source):
            let vc = GenericTableViewController(source: source, title: "Movies and games", sectionHeaderViews: sectionViewsArray != nil ? viewsForMoviesAndGamesSection : nil)
            show(target: vc, sender: sender)
        case .error:
            showErrorView(sender: sender)
        }
    }
    
    private func showErrorView(sender: UIViewController) {
        let vc = UIStoryboard.defaultStoryboard.instantiateViewController(ofType: CustomViewController.self)
        show(target: vc, sender: sender)
    }
    
    private func goToScreen(sender: UIViewController) -> (MainSelectionModel) -> Void {
        return { [weak self] (model: MainSelectionModel) in
            guard let strongSelf = self else { return }
            switch model.title {
            case "Games":
                var itemsForGames = [[GameModel]]()
                strongSelf.sectionViewsArray = SectionViews.viewsArray
                if let sectionViewsArray = strongSelf.sectionViewsArray {
                    for view in sectionViewsArray {
                        strongSelf.viewsForGameSection.append(view.label)
                        itemsForGames.append(Source.games)
                    }
                } else {
                    itemsForGames.append(Source.games)
                }
                strongSelf.show(segue: .games(source: itemsForGames), sender: sender)
            case "Movies":
                var itemsForMovies = [[MovieModel]]()
                strongSelf.sectionViewsArray = SectionViews.viewsArray
                if let sectionViewsArray = strongSelf.sectionViewsArray {
                    for view in sectionViewsArray {
                        strongSelf.viewsForMoviesSection.append(view.label)
                        itemsForMovies.append(Source.movies)
                    }
                } else {
                    itemsForMovies.append(Source.movies)
                }
                strongSelf.show(segue: .movies(source: itemsForMovies), sender: sender)
            case "Movies and games":
                var itemsForMoviesAndGames = [[MoviesAndGamesModel]]()
                strongSelf.sectionViewsArray = SectionViews.viewsArray
                if let sectionViewsArray = strongSelf.sectionViewsArray {
                    for view in sectionViewsArray {
                        strongSelf.viewsForMoviesAndGamesSection.append(view.label)
                        itemsForMoviesAndGames.append(Source.gamesAndMovies)
                    }
                } else {
                    itemsForMoviesAndGames.append(Source.gamesAndMovies)
                }
                strongSelf.show(segue: .gamesAndMovies(source: itemsForMoviesAndGames) , sender: sender)
            default:
                break
            }
        }
    }
    
    private func show(target: UIViewController, sender: UIViewController) {
        if let nav = sender as? UINavigationController {
            nav.pushViewController(target, animated: false)
            return
        }
        
        if let nav = sender.navigationController {
            nav.pushViewController(target, animated: true)
        } else {
            sender.present(target, animated: true, completion: nil)
        }
    }
}
