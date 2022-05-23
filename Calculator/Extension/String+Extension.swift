//
//  String+Extension.swift
//  Calculator
//
//  Created by 재재 on 2022/05/23.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        self.split(separator: target).map { String($0) }
    }
}
