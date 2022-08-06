//
//  UIFont+YHKit.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/6.
//

import Foundation
import UIKit

extension UIFont {
    static func logAllFontNames() {     //添加字体的时候 遍历打印，以便使用 不知道R.Swift里面有没有做优化
        let fontFamilies = UIFont.familyNames
        for fontFamily in fontFamilies {
            let fontNames = UIFont.fontNames(forFamilyName: fontFamily)
            print("fontNames : \n\(fontNames)")
        }
    }
}
