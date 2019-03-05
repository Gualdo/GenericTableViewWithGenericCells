//
//  UIStoryboard+Factory.swift
//  GenericTableViewWithGenericCells
//
//  Created by De La Cruz, Eduardo on 05/03/2019.
//  Copyright © 2019 De La Cruz, Eduardo. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static var defaultStoryboard: UIStoryboard {
        return  UIStoryboard(name: "Main", bundle: nil)
    }
    
    func instantiateViewController<T>(ofType type: T.Type) -> T {
        guard let instance = instantiateViewController(withIdentifier: String(describing: type)) as? T else {
            fatalError("Oops!")
        }
        return instance
    }
}
