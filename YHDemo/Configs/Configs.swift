//
//  Configs.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/5.
//

import Foundation
import UIKit

struct BaseDimensions {
    static var screenWidth: CGFloat  {
        get {
            return UIScreen.main.bounds.width
        }
    }
    static var screenHeight: CGFloat {
        get {
            return UIScreen.main.bounds.height
        }
    }
    
    static let animDuration: CGFloat = 0.25
    
    static let inset: CGFloat = 8
    static let tabBarHeight: CGFloat = 58
    static let toolBarHeight: CGFloat = 66
    static let navBarWithStatusBarHeight: CGFloat = 64
    static let cornerRadius: CGFloat = 8
    static let borderWidth: CGFloat = 1
    static let buttonHeight: CGFloat = 45
    static let textFieldHeight: CGFloat = 40
    static let tableRowHeight: CGFloat = 44
}
