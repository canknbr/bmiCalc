//
//  Calculate.swift
//  bmiCalc
//
//  Created by Can Kanbur on 7.04.2023.
//

import Foundation
import UIKit
struct Calculate {
    
    var bmi : BMI?
    
    mutating func getBmiValue(weight:Float,height : Float){
        
       let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "eat more", color: .blue)
        }else if bmiValue <= 24.5{
            bmi = BMI(value: bmiValue, advice: "fit as a fiddle", color: .green)
        }else{
            bmi = BMI(value: bmiValue, advice: "eat less", color: .blue)
        }
        
    }
    func getTextBmi() -> String{
        if let myBmi = bmi?.value {
            return String(format: "%.2f", myBmi)
        }else{
            return "0.0"
        }
        
    }
    func getAdvice() -> String {
        return bmi!.advice
    }
    func getColor() -> UIColor {
        return bmi?.color ?? .red
    }
}
