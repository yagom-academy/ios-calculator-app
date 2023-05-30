//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var myQueue = CalculatorItemQueue<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        myQueue.enqueue(digit)
        print(myQueue)
    }
    
    @IBAction func allClear(_ sender: UIButton) {
        myQueue.clear()
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
}

