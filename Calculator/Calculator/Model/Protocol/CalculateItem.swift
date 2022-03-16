//
//  CalculateItem.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/15.
//

import Foundation

protocol CalculateItem {
    
}

extension Int: CalculateItem {}
extension String: CalculateItem {}
extension Double: CalculateItem {}
