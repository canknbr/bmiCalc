//
//  ViewController.swift
//  bmiCalc
//
//  Created by Can Kanbur on 7.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculate = Calculate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func heightChanged(_ sender: UISlider) {
        let height = (String(format: "%.2f", sender.value))
        heightLabel.text = "\(height)m"
    }
    

    @IBAction func weightChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)kg"
    }
    @IBAction func calculateButton(_ sender: UIButton) {
        
        calculate.getBmiValue(weight: weightSlider.value, height: heightSlider.value)
        
        performSegue(withIdentifier: "toSecondVC", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC"{
            let destination = segue.destination  as! SecondViewController
            destination.value = calculate.getTextBmi()
            destination.advice = calculate.getAdvice()
            destination.color = calculate.getColor()
        }
    }
}

