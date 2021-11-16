//
//  Extension+String.swift
//  Calculator
//
//  Created by Sunwoo on 2021/11/16.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
