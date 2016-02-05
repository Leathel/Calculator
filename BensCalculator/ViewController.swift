//
//  ViewController.swift
//  BensCalculator
//
//  Created by student on 2016-02-02.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var currentNum = Float()
    var currentNumString = String()
    var result = Float()
    var currentOperation = String()
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labelResult.text = "0"
    }
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var warningLabel: UILabel!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonNumPad(sender: UIButton) {
        if(currentNumString.characters.count >= 9)
        {
            warningLabel.text = "Too Many Numbers Bro"
        }
        else
        {
            currentNum = Float(labelResult.text!)!
            currentNumString = String(currentNum)

            warningLabel.text = ""
            if(currentNum == 0)
            {
                currentNumString = sender.currentTitle!
            }
            else
            {
                currentNumString = labelResult.text! + sender.currentTitle!
            }
            currentNum = Float(currentNumString)!
            labelResult.text = currentNumString

        }
        
        
    }
    @IBAction func functionButton(sender: UIButton) {
        currentOperation = sender.currentTitle
        
        if(currentOperation == "Reset")
        {
            labelResult.text = ""
            warningLabel.text = ""
            currentNum = 0
            currentNumString = ""
            
        }
        
        
        
        
        
    }

}

