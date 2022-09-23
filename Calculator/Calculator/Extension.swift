//
//  Extension.swift
//  Calculator
//
//  Created by 정선아 on 2022/09/23.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let splited = String(target)
        let replaced = self.replacingOccurrences(of: splited, with: " \(splited) ")
        let separator = replaced.split(separator: " ").map { String($0) }
        
        return separator
    }
}

extension Double {
    
}
