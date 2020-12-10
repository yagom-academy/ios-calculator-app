//
//  Jake.swift
//  Calculator
//
//  Created by Yeon on 2020/12/08.
//

import UIKit

class JakeViewController: UIViewController {
    var decimalCalculator: DecimalCalculator = DecimalCalculator()
    var binaryCalculator: BinaryCalculator = BinaryCalculator()
    override func viewDidLoad() {
        super.viewDidLoad()
        let infix = ["2","-","4","+","-3","*","3","/","3"]
        do {
            let result = try decimalCalculator.calculate(infix)
            print(result)
        } catch {
            print("오류")
        }
        
        let binaryInfix = ["1010","~&","0000"]
        do {
            let result = try binaryCalculator.calculate(binaryInfix)
            print(result)
        } catch {
            print("오류")
        }
    }
    
}

