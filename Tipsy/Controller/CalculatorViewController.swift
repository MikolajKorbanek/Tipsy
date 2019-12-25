//
//  ViewController.swift
//  Tipsy
//
//  Created by Mikolaj Korbanek on 25/12/2019.
//  Copyright © 2019 Mikolaj Korbanek. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPct: Float = 0.1
    var nmbOfPpl: Int = 2
    var billPerPerson: Float = 0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        resetButtons()
        sender.isSelected = true
        tipPct = Float(sender.tag) / 10.0
        print(tipPct)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        nmbOfPpl = Int(sender.value)
        splitNumberLabel.text = "\(nmbOfPpl)"
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        var billAmount: Float = 0
        if let safeBillText = billTextField.text {
            billAmount = Float(safeBillText) ?? 0
        } else {
            billAmount = 0.0
        }
        
        let totalBill = billAmount + tipPct * billAmount
        billPerPerson = totalBill / Float(nmbOfPpl)
        
        billPerPerson = (billPerPerson * 100).rounded(.up) / 100

        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    private func resetButtons() {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.billPerPerson = billPerPerson
            destinationVC.nmbOfPpl = nmbOfPpl
            destinationVC.tipPct = Int(tipPct * 100)
        }
    }
}

