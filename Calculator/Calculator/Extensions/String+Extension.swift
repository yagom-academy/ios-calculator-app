//
//  String+Extension.swift
//  Calculator
//
//  Created by yeha on 2021/11/15.
//

import Foundation

extension String {
    func split(with target: Character = " ") -> [String] {
        return split(separator: target).map({ String($0) })
    }
}
