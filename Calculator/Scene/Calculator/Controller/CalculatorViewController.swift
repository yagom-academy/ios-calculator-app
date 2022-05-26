//
//  Calculator - CalculatorViewController.swift
//  Created by bonf. 
//  Copyright © yagom. All rights reserved.
// 
import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet var currentValue: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue[0].text = ""
    }
    
    @IBAction func tappedNumbers(_ sender: UIButton) {
        // 숫자 텍스트 += 해주기
        guard let number = sender.currentTitle else { return }
        currentValue[0].text! += number
    }
    
    @IBAction func tappedDot(_ sender: UIButton) {
        var isDot: Bool {
            if currentValue[0].text!.contains(".") {
                return false
            } else {
                return true
            }
        }
        if isDot {
            currentValue[0].text! += "."
        }
    }
    
    @IBAction func tappedOperators(_ sender: UIButton) {
        // 숫자가 있을경우
        // 뒤에 숫자 0 지워주기
        // 초기 연산자 비워두고 연산자가 다르면 현재 수량 연산자 넣어주기
        // 연산자가 같으면 액션 없을 무
        
        //숫자가 없을 경우 연산자 바꿔줌
    }
    
    @IBAction func tappedResult(_ sender: UIButton) {
        // 넣어준 값 다 지워주고 current값에 결과 넣어주기
    }
    
    @IBAction func tappedChangeValue(_ sender: UIButton) {
        // +/-일 경우 int로 변환하여 -를 곱해주고 다시 String으로 변환-> 소수점이 사라질 수 있음 double로 변환 경우 소수점이 생길 수 있음
        // CE일 경우 현재 레이블의 연산자, 숫자 지우고 이전의 연산자와 숫자 가져오기.
        // AC일 경우 모두 삭제
    }
}

