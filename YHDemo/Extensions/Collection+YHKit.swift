//
//  Collection+YHKit.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/6.
//

import Foundation

extension Array {
    func jsonString() -> String {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.init(rawValue: 0))
            return String(data: data, encoding: .utf8) ?? ""
        } catch let error {
            print(error)
        }
        return ""
    }
}

extension Dictionary {
    func jsonString() -> String {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.init(rawValue: 0))
            return String(data: data, encoding: .utf8) ?? ""
        } catch let error {
            print(error)
        }
        return ""
    }
}
