//
//  MovableDimensionManager.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/7.
//

import UIKit

enum MovableItemWidthDescription: Int {
    case half = 0
    case full
}

class MovableDimensionManager: NSObject {
    let sectionInset: CGFloat = 10
    let lineSpacing: CGFloat = 10
    let itemSpacing: CGFloat = 10
    let itemHeight: CGFloat = 80
    var itemSizeArray: [CGSize] = []
    private lazy var itemWidthFull: CGFloat = {
        return BaseDimensions.screenWidth - sectionInset * 2
    }()
    private lazy var itemWidthHalf: CGFloat = {
        return (itemWidthFull - itemSpacing) / 2.0
    }()
    
    func loadGrideSizeData(with descriptions: [MovableItemWidthDescription]) {
        itemSizeArray = descriptions.map {
            return CGSize(width: $0 == .full ? itemWidthFull: itemWidthHalf, height: itemHeight)
        }
    }
    
}
