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
            
    }
    @IBOutlet weak var storedNumLabel: UILabel!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var testLabel: UILabel!

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
        testLabel.text = String(currentNum)
        
    }
    @IBAction func functionButton(sender: UIButton) {
        currentOperation = sender.currentTitle!
        // Reset
        if(currentOperation == "Reset")
        {
            labelResult.text = "0"
            warningLabel.text = ""
            currentNum = 0
            currentNumString = ""
            storedNum = 0
            
        }
        //Delete
        else if(currentOperation == "Del")
        {
            
        }
        //function
        else if(currentOperation == "+" || currentOperation == "-" || currentOperation == "X" || currentOperation == "/")
        {
            
            operationClicked = true;
            currentNum = 0
            currentNumString = "0"
            
            labelResult.text = currentNumString
            storedNumLabel.text = "stored:" + String(storedNum)
            
            
        }
        
        
        
        
    }

    @IBAction func equalsClicked(sender: UIButton) {
        storedNum = currentNum
        if (currentOperation == "")
        {
            
        }
        else if(currentOperation == "+")
        {
            warningLabel.text = "+ clicked"
            result = currentNum + storedNum
            labelResult.text = String(result)
            storedNum = result
            storedNumLabel.text = "stored:" + String(storedNum)
        }
        else if(currentOperation == "-")
        {
            result = currentNum - storedNum
            labelResult.text = String(storedNum)
            storedNum = result
        }

        else if(currentOperation == "/")
        {
            result = currentNum / storedNum
            labelResult.text = String(storedNum)
            storedNum = result
        }

        else if(currentOperation == "X")
        {
            result = currentNum * storedNum
            labelResult.text = String(storedNum)
            storedNum = result
        }

        
    }
}

