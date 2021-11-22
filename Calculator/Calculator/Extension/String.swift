//
//  String.swift
//  Calculator
//
//  Created by 고은 on 2021/11/22.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        self.split(separator: target).map { String($0) }
    }
}
