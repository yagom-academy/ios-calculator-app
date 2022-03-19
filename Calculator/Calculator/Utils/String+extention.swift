//
//  String+extention.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/18.
//

import Foundation

// 무언가를 기준으로 쪼개서 스트링 배열으로
extension String {
    func split(with target: Character) -> [String] {
        return split(separator: target).map{ String($0) }
    }
}

