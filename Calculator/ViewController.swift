//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   private var isFinishedTyping = true
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTyping = true
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert label text to a double")
        }
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            }
            else if calcMethod == "AC" {
                displayLabel.text = "0"
            }
            else if calcMethod == "%" {
                displayLabel.text = String(number / 100)
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
            if let numValue = sender.currentTitle {
                if isFinishedTyping {
                    displayLabel.text = numValue
                    isFinishedTyping = false
                }
                else {
                    if numValue == "." {
                        guard let currentDisplayValue = Double(displayLabel.text!) else {
                            
                            fatalError("Cannot convert display label text to double value")
                        }
                        
                        let isInt = floor(currentDisplayValue) == currentDisplayValue
                        if !isInt {//above isInt must be false to execute this line of code
                            print("Checking mechanisn")
                            return 
                        }
                    }
                    displayLabel.text = displayLabel.text! + numValue
                }
            }
        }
       
    
    }//End of class


