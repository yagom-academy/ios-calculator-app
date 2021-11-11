//
//  String-Extension.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/10.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let stringArray: [String] = self.split(separator: target).map{ String($0) }
        
        return stringArray
    }
}
