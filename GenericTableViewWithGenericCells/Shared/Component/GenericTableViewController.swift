//
//  ViewController.swift
//  GenericTableViewWithGenericCells
//
//  Created by De La Cruz, Eduardo on 04/03/2019.
//  Copyright © 2019 De La Cruz, Eduardo. All rights reserved.
//

import UIKit

class GenericTableViewController<T: DescriptiveProtocol>: UITableViewController {
    
    var didSelect: (T) -> () = { _ in }
    private var source: [[T]] = [[T]]()
    var viewsForSection: [UIView]?
    
    init(source: [[T]], title: String, sectionHeaderViews: [UIView]? = nil) {
        self.source = source
        super.init(style: .plain)
        self.title = title
        self.viewsForSection = sectionHeaderViews
        self.tableView.tableFooterView = UIView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
    }
    
    private func register() {
        for item in source {
            Set(item.compactMap({$0.descriptor.reuseIdentifier})).forEach({
                tableView.register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
            })
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return source.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let _ = self.viewsForSection else { return 0 }
        return tableView.sectionHeaderHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionsViews = self.viewsForSection else { return nil }
        return sectionsViews[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let descriptor = source[indexPath.section][indexPath.row].descriptor
        let cell = tableView.dequeueReusableCell(withIdentifier: descriptor.reuseIdentifier, for: indexPath)
        descriptor.configure(cell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = source[indexPath.section][indexPath.row]
        didSelect(item)
    }
}
