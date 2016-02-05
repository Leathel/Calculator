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
    var storedNum = Float()
    var currentNumString = String()
    var result = Float()
    var currentOperation = String()
    var operationClicked = Bool()
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labelResult.text = "0"
            currentNum = 0
            storedNum = 0
            currentNumString = "0"
            
    }
    @IBOutlet weak var storedNumLabel: UILabel!
    @IBOutlet weak var currentFunctionLabel: UILabel!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var testLabel: UILabel!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonNumPad(sender: UIButton) {
        if(labelResult.text!.characters.count >= 9)
        {
            warningLabel.text = "Too Many Numbers Bro"
        }
        else
        {
            if(currentNumString == "0")
            {
                
                if(sender.currentTitle == ".")
                {
                    currentNumString = "0.0"
                }
                else
                {
                    currentNumString = sender.currentTitle!
                }
            }
            else if(currentNumString == "0.0")
            {
                if(sender.currentTitle == "0")
                {
                    currentNumString = "0.0" + sender.currentTitle!
                }
                else{
                    currentNumString = "0." + sender.currentTitle!

                }
            }
            else
            {
                currentNumString = labelResult.text! + sender.currentTitle!
            }
            
            labelResult.text = currentNumString
            currentNum = Float(currentNumString)!
            
        }
        warningLabel.text = "Stored Number: " + String(storedNum)
        testLabel.text = "Current Number: " + String(currentNum)
        
    }
    @IBAction func functionButton(sender: UIButton) {
        currentOperation = sender.currentTitle!
        currentNum = Float(currentNumString)!
        // Reset
        if(currentOperation == "Reset")
        {
            
            currentNum = 0
            currentNumString = "0"
            storedNum = 0
            labelResult.text = currentNumString
            warningLabel.text = "Stored Number: " + String(storedNum)
            testLabel.text = "Current Number: " + String(currentNum)
            currentOperation = ""
            currentFunctionLabel.text = ""
            
        }
        //Delete
        else if(currentOperation == "Del")
        {
            
        }
        //math function
        else if(currentOperation == "+" || currentOperation == "-" || currentOperation == "X" || currentOperation == "/")
        {
            
            storedNum = currentNum
            currentNum = 0
            currentNumString = "0"
            labelResult.text = currentNumString
            warningLabel.text = "Stored Number: " + String(storedNum)
            testLabel.text = "Current Number: " + String(currentNum)
            
        }
        
        
        
        
    }

    @IBAction func equalsClicked(sender: UIButton) {
        
        currentFunctionLabel.text = currentOperation
        if (currentOperation == "")
        {
            
        }
        else if(currentOperation == "+")
        {
            
            result = storedNum + currentNum
            
            
            
        }
        else if(currentOperation == "-")
        {
            result = storedNum - currentNum
        }

        else if(currentOperation == "/")
        {
            result = storedNum / currentNum
        }

        else if(currentOperation == "X")
        {
           result = storedNum * currentNum
        }
        storedNum = result
        currentNumString = String(result)
        labelResult.text = currentNumString
        warningLabel.text = "Stored Number: " + String(storedNum)
        testLabel.text = "Current Number: " + String(currentNum)

    }
}

