//
//  Extension.swift
//  Calculator
//
//  Created by 정선아 on 2022/09/23.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let splitComponents = self.split(separator: target, omittingEmptySubsequences: true)
        var result = [String]()
        
        splitComponents.forEach { result.append(String($0)) }
        
        return result
    }
}

extension Double {
    
}
