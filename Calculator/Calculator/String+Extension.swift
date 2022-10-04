//
//  String+Extension.swift
//  Calculator
//
//  Created by 서현웅 on 2022/10/04.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map{ String($0) }
    }
}
