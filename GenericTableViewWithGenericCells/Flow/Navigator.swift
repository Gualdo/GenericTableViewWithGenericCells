//
//  Navigator.swift
//  GenericTableViewWithGenericCells
//
//  Created by De La Cruz, Eduardo on 05/03/2019.
//  Copyright © 2019 De La Cruz, Eduardo. All rights reserved.
//

import UIKit

enum Segue {
    case home(source: [MainSelectionModel])
    case games(source: [GameModel])
    case movies(source: [MovieModel])
    case gamesAndMovies(source: [MoviesAndGames])
    case error
}

final class Navigator {
    
    func show(segue: Segue, sender: UIViewController) {
        switch segue {
        case .home(let source):
            let homeViewController = GenericTableViewController(source: source, title: "Menu")
            homeViewController.didSelect = goToScreen(sender: homeViewController)
            show(target: homeViewController, sender: sender)
        case .games(let source):
            let vc = GenericTableViewController(source: source, title: "Games")
            show(target: vc, sender: sender)
        case .movies(let source):
            let vc = GenericTableViewController(source: source, title: "Movies")
            show(target: vc, sender: sender)
        case .gamesAndMovies(let source):
            let vc = GenericTableViewController(source: source, title: "Movies and games")
            show(target: vc, sender: sender)
//            let vc = GenericTableViewController(source: source, title: "Movies and games")
//            vc.didSelect = { [weak self] _ in
//                guard let strongSelf = self else { return }
//                strongSelf.show(segue: .error, sender: sender)
//            }
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
                strongSelf.show(segue: .games(source: Source.games), sender: sender)
            case "Movies":
                strongSelf.show(segue: .movies(source: Source.movies), sender: sender)
            case "Movies and games":
                strongSelf.show(segue: .gamesAndMovies(source: Source.gamesAndMovies) , sender: sender)
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
