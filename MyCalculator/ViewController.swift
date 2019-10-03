//
//  ViewController.swift
//  MyCalculator
//
//  Created by Student on 2019-09-28.
//  Copyright © 2019 Student. All rights reserved.
//Student ID: 301089444
//Date:



import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var previousNumber : Double = 0
    var numberOnScreen : Double = 0
    var preTag = "+"
    let tagList = ["+","-","*","/"]
    var modOccured = false
    var decimal : Bool = false
    
    // 
    
    @IBOutlet weak var numberDisplayed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func numberButtonsPressed(_ sender: UIButton) {
        //print(sender.tag)
        if (numberDisplayed.text! == "0" || numberDisplayed.text! == "+" || numberDisplayed.text! == "-" || numberDisplayed.text! == "*" || numberDisplayed.text! == "/" || modOccured ) && !(sender.tag == 0) && !(sender.tag==100){
            numberDisplayed.text = String(sender.tag)
        }
        else if sender.tag == 100 && !decimal{
            decimal = true
            numberDisplayed.text = numberDisplayed.text! + "."
        }
        else if !(numberDisplayed.text! == "0") && !(sender.tag == 100){
            numberDisplayed.text = numberDisplayed.text! + String(sender.tag)
        }
    }
    
    
    @IBAction func performOperation(_ sender: UIButton) {
        
        if previousNumber == 0 {
            previousNumber = Double(numberDisplayed.text!) ?? 0
            decimal = false
        }
        else{
            // decimal = true
            numberOnScreen = Double(numberDisplayed.text!) ?? 0
            if preTag == "+"{
                previousNumber += numberOnScreen
            }
            else if preTag == "-"{
                previousNumber -= numberOnScreen
            }
            else if preTag == "*"{
                previousNumber *= numberOnScreen
            }
            else if preTag == "/"{
                previousNumber /= numberOnScreen
            }
        }
        
        if sender.tag == 4{
            numberOnScreen = Double(numberDisplayed.text!) ?? 0
            previousNumber = numberOnScreen/100
            modOccured = true
            decimal = true
        }
        
        if sender.tag == 10 || sender.tag == 4{
            decimal = true
            numberDisplayed.text = String(previousNumber)
            previousNumber = 0
            preTag = "+"
        }
        else{
            numberDisplayed.text = String(tagList[sender.tag])
            preTag = tagList[sender.tag]
        }
    }
    
    
    @IBAction func clearScreen(_ sender: UIButton) {
        
        numberDisplayed.text = "0"
        previousNumber = 0
        numberOnScreen = 0
        preTag = "+"
        modOccured = false
        decimal = false
    }
    

    @IBAction func back(_ sender: UIButton) {
        
        if numberDisplayed.text!.count > 1{
            let index = numberDisplayed.text!.index(before: numberDisplayed.text!.endIndex)
        
            numberDisplayed.text = String(numberDisplayed.text![..<index])
            
            let dotCheck = numberDisplayed.text!.firstIndex(of: ".") ?? numberDisplayed.text!.endIndex
            
            if dotCheck == numberDisplayed.text!.endIndex{
                decimal = false
            }
            
            //print(String(displayNum.text![..<index]))
        }
        
        else if numberDisplayed.text!.count == 1{
            numberDisplayed.text = "0"
            decimal = false
        }
    }
    
    
    
    
}


