//
//  SectionViewModel.swift
//  GenericTableViewWithGenericCells
//
//  Created by De La Cruz, Eduardo on 05/03/2019.
//  Copyright © 2019 De La Cruz, Eduardo. All rights reserved.
//

import UIKit

struct SectionViews {
    let label = UILabel()
    
    init(_ labelTitle: String) {
        label.text = labelTitle
        label.backgroundColor = .lightGray
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    /*
     On this var you can toggle between commented / uncommented code to have or not have Sections
     */
    
    static var viewsArray: [SectionViews]? {
        return [SectionViews("Section 1"),
                SectionViews("Section 2"),
                SectionViews("Section 3"),
                SectionViews("Section 4")]
        
//        return nil
    }
}
