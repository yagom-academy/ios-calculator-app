//
//  CalculateItem.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/15.
//

import Foundation

protocol CalculateItem {}

extension Double: CalculateItem {}

extension String {
    func split(with target: Character) -> [String] {
        let convertStringArray = Array(arrayLiteral: target).map{ String($0) }
        return convertStringArray
    }
}
