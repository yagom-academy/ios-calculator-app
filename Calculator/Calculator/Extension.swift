//
//  Extension.swift
//  Calculator
//
//  Created by 정선아 on 2022/09/23.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}

extension Double {
    
}
