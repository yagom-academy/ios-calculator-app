//
//  Calculator - CalculatorViewController.swift
//  Created by bonf. 
//  Copyright © yagom. All rights reserved.
// 
import UIKit
import Foundation

class CalculatorViewController: UIViewController {
    
    @IBOutlet var currentValue: [UILabel]!
    
    @IBOutlet var inputedValue: [UILabel]!
    
    @IBOutlet weak var expressionOpers: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue[0].text = ""
        currentValue[1].text = "0"
        inputedValue.forEach { value in
            value.text = ""
        }
    }
    
    @IBAction func tappedNumbers(_ sender: UIButton) {
        // 숫자 텍스트 += 해주기
        // currentValue가 0일 때 , 0또는00을 누를 경우 무반응 다른거 누를경우 0지움
        guard let number = sender.currentTitle,
        var value = currentValue[1].text else {
            return
        }
        
        guard value == "0" else {
            value += number
            currentValue[1].text = value
            return
        }
        
        guard number == "0" || number == "00" else {
            currentValue[1].text = number
            return
        }
    }
    
    @IBAction func tappedDot(_ sender: UIButton) {
        guard var value = currentValue[1].text else { return }
        var isDot: Bool {
            if value.contains(".") {
                return false
            } else {
                return true
            }
        }
        if isDot {
            value += "."
            currentValue[1].text = value
        }
    }
    
    @IBAction func tappedOperators(_ sender: UIButton) {
        // 뒤에 숫자 0 지워주기
        // 초기 연산자 비워두고 연산자가 다르면 현재 수량 연산자 넣어주기
        // 연산자가 같으면 액션 없을 무
        guard var value = currentValue[1].text else { return }
        var isDot: Bool {
            if value.contains(".") {
                return true
            } else {
                return false
            }
        }
        if isDot {
            while value.last == "0" {
                value.removeLast()
            }
            if value.last == "."{
                value.removeLast()
            }
            currentValue[1].text = value
        }
        inputedValue[0].text = currentValue[0].text
        inputedValue[1].text = currentValue[1].text
        currentValue[0].text = sender.currentTitle
        currentValue[1].text = "0"
    }
    
    @IBAction func tappedResult(_ sender: UIButton) {
        // 넣어준 값 다 지워주고 current값에 결과 넣어주기
    }
    
    @IBAction func tappedChangeValue(_ sender: UIButton) {
        // +/-일 경우 int로 변환하여 -를 곱해주고 다시 String으로 변환-> 소수점이 사라질 수 있음 double로 변환 경우 소수점이 생길 수 있음
        // CE일 경우 현재 레이블의 연산자, 숫자 지우고 이전의 연산자와 숫자 가져오기.
        // AC일 경우 모두 삭제
        let changeValue = sender.tag
        if changeValue == 0 {
            currentValue[0].text = ""
            currentValue[1].text = "0"
            inputedValue.removeAll()
        } else if changeValue == 1 {
                currentValue[1].text = "0"
        } else {
            guard let value = currentValue[1].text else {
                return
            }
            guard value.first == "-" else {
                currentValue[1].text = "-\(value)"
                return
            }
            currentValue[1].text = value.filter { $0 != "-" }
        }
    }
    
    func createLabel(_ input: String) -> UILabel {
        let label = UILabel()
        label.text = input
        label.textAlignment = .right
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        return label
    }
    
    func createStackView(_ UILabel: [UILabel]) {

    }
}

