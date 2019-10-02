//
//  ViewController.swift
//  MyCalculator
//
//  Created by Student on 2019-09-28.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false;
    var operation = 0;
    

    @IBAction func numbers(_ sender: UIButton) {

        let value:String = sender.titleLabel?.text ?? ""
        
        if performingMath == true {
            
            LabelUI.text = value
            numberOnScreen = Double(LabelUI.text!)!
            performingMath = false
            
            
        }
        else {
            
            LabelUI.text = LabelUI.text! + value
            
            numberOnScreen = Double(LabelUI.text!)!
            
        }
    }
    @IBOutlet weak var LabelUI: UILabel!
    
    @IBAction func UIButton( sender: UIButton)
    {
       if LabelUI.text != "" && sender.tag != 11 && sender.tag != 18{
        previousNumber = Double(LabelUI.text!)!
        
        if sender.tag == 14 { //Divide
            
            LabelUI.text = "÷";
            
        }
        
        if sender.tag == 15 { //Multiply
            
            LabelUI.text = "x";
            
        }
        
        if sender.tag == 16 { //Subtract
            
            LabelUI.text = "-";
            
        }
        
        if sender.tag == 17 { //Add
            
            LabelUI.text = "+";
            
        }
        
        
        
        operation = sender.tag
        
        performingMath = true;
        
    }
    
    else if sender.tag == 18 {
    
    if operation == 14{ //Divide
    
    LabelUI.text = String(previousNumber / numberOnScreen)
    
    }
    
    else if operation == 15{ //Multiply
    
    LabelUI.text = String(previousNumber * numberOnScreen)
    
    }
    
    else if operation == 16{ //Subtract
    
    LabelUI.text = String(previousNumber - numberOnScreen)
    
    }
    
    else if operation == 17{ //Add
    
    LabelUI.text = String(previousNumber + numberOnScreen)
    
    }
    
    else if operation == 19{ //Decimal
        if sender.tag == 19 { //Decimal
            if (!(LabelUI.text?.contains("."))!)
            {
                LabelUI.text = LabelUI.text! + "."
                numberOnScreen = Double(LabelUI.text!)!
            }
            
        }
        }
     
        
    }
    
    else if sender.tag == 11{
    
    LabelUI.text = ""
    
    previousNumber = 0;
    
    numberOnScreen = 0;
    
    operation = 0;
        
    }

    
}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
}

