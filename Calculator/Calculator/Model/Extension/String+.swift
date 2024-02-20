//
//  String+.swift
//  Calculator
//
//  Created by EUNJI CHOI on 2/20/24.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(whereSeparator: { $0 == target }).map(String.init)
    }
}
