//
//  String+YHKit.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/6.
//

import Foundation
import UIKit
import CommonCrypto

extension String {
    func height(inSize size: CGSize, font: UIFont) -> CGFloat {
        NSString(string: self).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil).size.height
    }
    
    func width(inSize size: CGSize = .zero, font: UIFont) -> CGFloat {
        if size == .zero {
            return NSString(string: self).size(withAttributes: [.font: font]).width
        } else {
            return NSString(string: self).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil).size.width
        }
    }
    
    subscript (i: Int) -> String {
        let startIndex = index(self.startIndex, offsetBy: i)
        let endIndex = index(startIndex, offsetBy: 1)
        return String(self[startIndex..<endIndex])
    }
    
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            return String(self[startIndex ..< endIndex])
        }
    }
    
    subscript (index:Int , length:Int) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            let endIndex = self.index(startIndex, offsetBy: length)
            return String(self[startIndex..<endIndex])
        }
    }
    
    func substring(to:Int) -> String{
        return self[0..<to]
    }
    
    func substring(from:Int) -> String{
        return self[from..<self.count]
    }
    
    func encryptByMD5() -> String {
        let cCharArray = self.cString(using: .utf8)
        var uint8Array = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(cCharArray, CC_LONG(cCharArray!.count - 1), &uint8Array)
        return uint8Array.reduce("") { $0 + String(format: "%02x", $1) }
    }
    
    func toArray() -> [Any] {
        return convertToCollection() ?? []
    }
    
    func toDictionary() -> [String: Any] {
        return convertToCollection() ?? [:]
    }
    
    private func convertToCollection<T>() -> T? {
        if let data = self.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: [JSONSerialization.ReadingOptions.init(rawValue: 0)]) as? T
            } catch let error as NSError {
                 print(error)
            }
        }
        return nil
    }

}
