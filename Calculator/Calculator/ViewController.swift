//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var myQueue = CalculatorItemQueue<String>()

    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var displayCalculationLabel: UILabel!
    @IBOutlet weak var firstProcessLabel: UILabel!
    @IBOutlet weak var secondProcessLabel: UILabel!
    @IBOutlet weak var firstCalculationLabel: UILabel!
    @IBOutlet weak var secondCalculationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setText()
    }
    
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        guard let currentText = displayLabel.text else { return }
        
        displayLabel.text = currentText + digit
        myQueue.enqueue(digit)
        print(myQueue)
    }
    
    @IBAction func allClear(_ sender: UIButton) {
        myQueue.clear()
        setText()
        print(myQueue)
    }
    
    @IBAction func clearEntry(_ sender: UIButton) {
        myQueue.dequeue()
        print(myQueue)
    }
    
    @IBAction func division(_ sender: UIButton) {
        let calculation = sender.currentTitle!
        
        myQueue.enqueue(calculation)
        print(myQueue)
    }
    
    @IBAction func multiplication(_ sender: UIButton) {
        let calculation = sender.currentTitle!
        
        myQueue.enqueue(calculation)
        print(myQueue)
    }
    
    @IBAction func subtraction(_ sender: UIButton) {
        let calculation = sender.currentTitle!
        
        myQueue.enqueue(calculation)
        print(myQueue)
    }
    
    @IBAction func addtion(_ sender: UIButton) {
        let calculation = sender.currentTitle!
        
        myQueue.enqueue(calculation)
        print(myQueue)
    }
    
    @IBAction func compute(_ sender: UIButton) {
        let calculation = sender.currentTitle!
        
        myQueue.enqueue(calculation)
        print(myQueue)
    }
    
    func setText() {
        displayLabel.text = ""
        displayCalculationLabel.text = ""
        firstProcessLabel.text = ""
        secondProcessLabel.text = ""
        firstCalculationLabel.text = ""
        secondCalculationLabel.text = ""
    }
    
}

