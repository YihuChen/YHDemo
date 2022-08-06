//
//  UILabel+YHKit.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/6.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(text: String = "", textColor: UIColor, font: UIFont  = .systemFont(ofSize: 14)) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = font
    }
}
