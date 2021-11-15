//
//  Extension.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/09.
//

import Foundation

extension Double: CalculateItem {
    
}

extension String {
    func split(with target: Character) -> [String] {        
        return self.split(separator: target).map { (splitedString: Substring) -> String in return String(splitedString) }
    }
}
