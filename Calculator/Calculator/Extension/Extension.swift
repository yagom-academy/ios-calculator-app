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
    func split(with target: Character) throws-> [String] {
        let splitedString = self.split(separator: target)
        guard let returnArrayOfString = splitedString as? [String] else {
            throw StringError.splitStringFailed
        }
        return returnArrayOfString
    }
}
