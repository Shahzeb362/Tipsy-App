//
//  ViewController.swift
//  Tipsy
//
//  Created by Shahzeb Khan on 09/09/2025.


import UIKit

class CalculatorViewController: UIViewController {
    
    // Ui code
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
  
    // declaration of Brain struct from Brain.swift
    var brain = Brain()
    
    
    
    // tip selection button
    @IBAction func tipChangedButton(_ sender: UIButton) {
        
        // when user press tipChange button the editing in the bill entry ui will end editing
        billTextField.endEditing(true)
        
        // make all the tip button deselect
        zeroPcButton.isSelected = false
        tenPcButton.isSelected = false
        twentyPcButton.isSelected = false
               
        //Make the button that triggered the IBAction selected.
        sender.isSelected = true
        
        //Get the current title of the button that was pressed.
        let buttonTitle = sender.currentTitle!
        
        //Remove the last character (%) from the title then turn it back into a String.
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        
        
               
        //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        brain.tip = brain.changeStringToDouble(value: buttonTitleMinusPercentSign)

       
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        
    
        splitNumberLabel.text = String(format: "%.0f",sender.value)
        
        brain.stepperValue =  sender.value
    }
    
    
    
    @IBAction func CalculateButton(_ sender: UIButton) {
        
        let bill = billTextField.text!
        
        if (bill != ""){
            
            
            brain.totalResult = brain.calculateBillResult(bill: bill, tip: brain.tip, people: brain.stepperValue)
              
            performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "goToResult"){
            
            let destinationVC = segue.destination as! ResultViewController?
            
            destinationVC?.totalBill = brain.totalResult
            destinationVC?.billSplit = Int(brain.stepperValue)
            destinationVC?.selectedTip = Int(brain.tip * 100)
            
            
        }
    }
    
    
    
    
    
}

