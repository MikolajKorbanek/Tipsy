//
//  ResultsController.swift
//  Tipsy
//
//  Created by Mikołaj Korbanek on 25/12/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    var billPerPerson: Float = 0.0
    var tipPct: Int = 0
    var nmbOfPpl: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(format: "%.2f", billPerPerson)
        settingLabel.text = "Split between \(nmbOfPpl) people, with \(tipPct)% tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recaculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }


}
