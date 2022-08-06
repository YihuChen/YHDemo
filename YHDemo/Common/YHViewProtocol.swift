//
//  YHViewProtocol.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/5.
//

import Foundation
import UIKit

protocol YHViewProtocol {
    func makeUI()
    func updateUI()
    func loadData(with dataModel: Any)
}

extension YHViewProtocol where Self: UIView {
    func makeUI() {
        //...
        //create views and set layouts
        updateUI()
    }
    func updateUI() {
        setNeedsDisplay()
    }
    func loadData(with dataModel: Any) {
        //show date
    }
}
