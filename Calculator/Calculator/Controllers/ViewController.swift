//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatingScrollView: UIScrollView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 숫자 버튼이 눌리면?
    // 1. 연산자 버튼이 눌리기 전까지 쌓아놔야 함.
    @IBAction func operandButtonTapped(_ sender: UIButton) {
    }
    
    
    // 연산자 버튼이 눌리면?
    // 1. 숫자 레이블을 0으로 바꿔야 함.
    // 2. parse를 실행해서 큐에 넣어야 함.
    // 2-2. 숫자가 없으면 parse를 실행하지 말아야 함.
    // 3. 스크롤뷰에 스택으로 쌓아야 함.
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
    }
    
    // 계산 버튼이 눌리면?
    // 1. 큐에 있는 값들을 result() 결과를 돌려줘야 함.
    // 2. 숫자 레이블 업데이트
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
    }
    
    // 부호 버튼이 눌리면?
    // 1. 현재 숫자 큐에 있는 값을 반대의 부호로 바꿔주어야 함.
    // 2. 숫자 레이블을 업데이트 해야함.
    @IBAction func signButtonTapped(_ sender: UIButton) {
    }
    
    // CE 버튼이 눌리면?
    // 1. 마지막으로 입력했었던 숫자를 없애야 함
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
    }
    
    // AC 버튼이 눌리면?
    // 1. 큐를 다 없애고, 0으로 초기화해야 함.
    // 2. 부호 레이블 및 숫자 레이블 업데이트
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
    }
}

 
