//
//  String+Extension.swift
//  Calculator
//
//  Created by kimseongjun on 2023/01/31.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        
        return split(separator: target).map { String($0) }
    }
}
