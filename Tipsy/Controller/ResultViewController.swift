//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Shahzeb Khan on 15.08.25.

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var totalBill: String?
    var billSplit = 12
    var selectedTip = 2
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalBill
        
        settingLabel.text = "spit between \(billSplit) with \(selectedTip)% tip"
        
        
    }
    
    
    
    @IBAction func recalculateButton(_ sender: Any) {
        
        dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
