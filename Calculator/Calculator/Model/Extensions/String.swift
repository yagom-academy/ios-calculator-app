//
//  String.swift
//  Calculator
//
//  Created by 이정민 on 2022/09/23.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map({ String($0) })
    }
}
