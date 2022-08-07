//
//  YHViewProtocol.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/5.
//

import Foundation
import UIKit

protocol YHRevealProtocol {
    func initConfig()
    func makeUI()
}

protocol YHViewProtocol: YHRevealProtocol {
    func loadData(with dataModel: Any)
}

protocol YHControllerProtocol: YHRevealProtocol {
    func fetchData()
}

extension YHViewProtocol where Self: UIView {
    func initConfig() { }
    func makeUI() { } 
    func loadData(with dataModel: Any) { }
}
