//
//  Extension+String.swift
//  Calculator
//
//  Created by 이차민 on 2021/11/12.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }        
    }
}
