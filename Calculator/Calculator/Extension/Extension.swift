//
//  Extension.swift
//  Calculator
//
//  Created by 정선아 on 2022/09/23.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let converted = String(target)
        let replaced = self.replacingOccurrences(of: converted, with: " \(converted) ")
        let splited = replaced.split(separator: " ").map { String($0) }
        return splited
    }
}

extension Double {
    
}
