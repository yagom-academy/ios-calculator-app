//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //test중
        var a = LinkedList<Int>()
        a.append(2)


        print(a.head?.data)
        print(a.head?.next?.data)

        a.removeLast()
        print(a.head?.data)
        print(a.head?.next?.data)

    }


}

