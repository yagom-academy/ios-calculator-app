//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var clearEntryButton: UIButton!
    @IBOutlet weak var signChangeButton: UIButton!
    @IBOutlet weak var currentEntryLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetCurrentEntry()
    }

    func resetCurrentEntry() {
        currentEntryLabel.text = "0"
    }
    
    func updateEntry(using input: String) {
        guard var currentEntry = currentEntryLabel.text else { return }
        guard input != "." || !currentEntry.contains(input) else  { return }
        
        if let firstLetter = currentEntry.first, firstLetter == "0"{
            currentEntry.removeFirst()
        }
        
        currentEntry += input
        currentEntryLabel.text = currentEntry
    }
}

