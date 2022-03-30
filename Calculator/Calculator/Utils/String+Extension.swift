//
//  String+Extension.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/28.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
}
