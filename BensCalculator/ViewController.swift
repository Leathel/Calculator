//
//  ViewController.swift
//  BensCalculator
//
//  Created by student on 2016-02-02.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // declare global vars
    var currentNum = Float()
    var storedNum = Float()
    var currentNumString = String()
    var result = Float()
    var currentOperation = String()
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labelResult.text = "0"
            currentNum = 0
            storedNum = 0
            currentNumString = "0"
            
    }
    //declare labels
    @IBOutlet weak var storedNumLabel: UILabel!
    @IBOutlet weak var currentFunctionLabel: UILabel!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var warningLabel: UILabel!

    @IBOutlet weak var testLabel: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//all the numbers actions take place in here
    @IBAction func buttonNumPad(sender: UIButton) {
        
        
        //if there are too many numbers, display this
        if(labelResult.text!.characters.count >= 9)
        {
            testLabel.text = "Too Many Numbers Bro"
        }
        else
        {
            //The follow will check for leading and trailing zeros and handle them apropriatly
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
            //each time  a number is clicked it is concatenated onto the display label and casted into an int
            labelResult.text = currentNumString
            currentNum = Float(currentNumString)!
            
        }
        warningLabel.text = String(storedNum)
        
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
            result = 0
            labelResult.text = currentNumString
            warningLabel.text = String(storedNum)
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

            
            warningLabel.text = String(storedNum)
            
        }
        
        
        
        
    }

    @IBAction func equalsClicked(sender: UIButton) {
        
        // I put this in a separate method because I was I had more functionality that required it to be this way. That didnt work tho so now it is like this.
        equalsFunction()
        
    }
    func equalsFunction(){
        
        //determines which function is being used, does the math, and then displays it all
        currentFunctionLabel.text = currentOperation
        if (currentOperation != "")
        {
            if(currentOperation == "+")
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
            warningLabel.text = String(storedNum)
            testLabel.text = ""
        }
        
        

    }
}

