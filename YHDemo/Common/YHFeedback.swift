//
//  YHFeedback.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/7.
//

import UIKit

class YHFeedback: UIFeedbackGenerator {
    static func occurred(_ style:UIImpactFeedbackGenerator.FeedbackStyle) {
        var feedBackGenertor: UIImpactFeedbackGenerator?
        switch style {
        case .soft, .rigid:
            if #available(iOS 13.0, *) {
                feedBackGenertor = UIImpactFeedbackGenerator(style: style)
            }
        default:
            feedBackGenertor = UIImpactFeedbackGenerator(style: style)
        }
        feedBackGenertor?.impactOccurred()
    }
}
