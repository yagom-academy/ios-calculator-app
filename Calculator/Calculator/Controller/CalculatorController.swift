//  CalculatorController.swift
//  Created by zhilly on 2022/09/29.

class CalculatorController {
    let view: MainViewController
    let formula: Formula
    
    init(view: MainViewController, model: Formula) {
        self.view = view
        self.formula = model
    }
}
