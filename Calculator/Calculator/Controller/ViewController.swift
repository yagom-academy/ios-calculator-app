//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayNumber: UILabel!
    @IBOutlet weak var displayOperator: UILabel!
    @IBOutlet weak var recentInputStackView: UIStackView!
    @IBOutlet weak var historyScrollView: UIScrollView!
    
    private let numberFormatter = NumberFormatter()
    private let zeroString = "0"
    private let emptyString = ""
    var calculateItems = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removeAllStackView(recentInputStackView)
        displayNumber.text = zeroString
        displayOperator.text = emptyString
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumFractionDigits = 20
    }
    
    func removeAllStackView(_ stack: UIStackView) {
        stack.arrangedSubviews.forEach {
            stack.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
    
    }


}

