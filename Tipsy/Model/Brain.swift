//
//  Brain.swift
//  Tipsy
//
//  Created by Shahzeb Khan on 17.08.25.


struct Brain {
    
    var tip = 0.10
    var stepperValue = 0.0
    var billTotal = 0.0
    var totalResult = ""
    var totalTip = ""
    
    
    
    
    
    func changeStringToDouble(value: String) -> Double{
        
        let buttonTitleAsANumber = Double(value)!
        return buttonTitleAsANumber / 100
    }
    
    
    func calculateBillResult(bill: String, tip: Double, people: Double) -> String {
        
        let result = Double(bill)! * (1 + tip) / people
        let result2Deci = String(format: "%.2f", result)
        return result2Deci
    }
    

    
    
   
}
