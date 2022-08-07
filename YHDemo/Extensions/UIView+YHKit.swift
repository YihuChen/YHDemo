//
//  UIView+YHKit.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/7.
//

import Foundation
import UIKit

extension UIView {
    func revealShadowLayer() {  //添加一个默认样式的阴影效果
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .init(width: 1, height: 1)
        layer.shadowOpacity = 0.3
    }
}
