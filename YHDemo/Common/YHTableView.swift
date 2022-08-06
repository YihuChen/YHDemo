//
//  YHTableView.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/6.
//

import UIKit

class YHTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    var dataArray: [[Any]] = [[]]
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        
        delegate = self
        dataSource = self
        register(YHTableViewCell.self, forCellReuseIdentifier: ReuseIdentifiers.YHTableViewCell)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.YHTableViewCell, for: indexPath)
        (cell as? YHTableViewCell)?.loadData(with: dataArray[indexPath.section][indexPath.row])
        return cell
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
