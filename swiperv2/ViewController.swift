//
//  ViewController.swift
//  swiperv2
//
//  Created by Alex Zhao on 2/17/18.
//  Copyright © 2018 HOTH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var options : [String] = ["Bruin Plate", "Covel Commons", "De Neve", "Feast at Rieber", "Bruin Café", "1919", "The Study at Hedrick"]
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func makeDecision(_ sender: UIButton) {
        let idx = Int(arc4random_uniform(7))
        resultLabel.text = "You should eat at " + options[idx]
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

