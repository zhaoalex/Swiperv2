//
//  ViewController.swift
//  swiperv2
//
//  Created by Alex Zhao on 2/17/18.
//  Copyright © 2018 HOTH. All rights reserved.
//
import UIKit
import SwiftSoup

class ViewController: UIViewController {
    var options: [String]?
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func makeDecision(_ sender: UIButton) {
        let idx = Int(arc4random_uniform(UInt32(options!.count)))
        resultLabel.text = "You should eat at " + options![idx]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        options = getData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData() -> Array<String> {
        let myURLString = "http://menu.dining.ucla.edu"
        guard let myURL = URL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return [String]()
        }
        
        do {
            let myHTMLString = try String(contentsOf: myURL, encoding: .ascii)
            //print(myHTMLString)
            let doc: Document = try! SwiftSoup.parse(myHTMLString)
            let mainContent: Elements = try! doc.select("#main-content").select("div").select("h2 ~ div").select(".half-col,.whole-col")
            
            var food = [String]()
            
            for div: Element in mainContent.array() {
                let p: Elements = try! div.select(".unit-name")
                for thing: Element in p.array() {
                    let name: String = try! thing.text()
                    food.append(name)
                }
            }
            
            /*for div in mainContent {
             print(div)
             
             }*/
            
            return food
        } catch let error {
            print("Error: \(error)")
        }
        return [String]()
}


}
