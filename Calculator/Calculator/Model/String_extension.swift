//
//  String_extension.swift
//  Calculator
//
//  Created by Whales on 2023/06/08.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        self.components(separatedBy: String(target))
    }
}
