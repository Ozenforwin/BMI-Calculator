//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Dyadichev on 16.02.2022.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "NIL"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .yellow
    }
    
    mutating func calculateBMI(weight: Float, height: Float) {
        
        let bmiValue = weight / (height * height)
        let bmiAdvice: String
        let bmiColor: UIColor
//        let bmiImage: UIImageView
        
        if bmiValue < 18.5 {
            bmiAdvice = "Надо больше кушац :)"
            bmiColor = .blue
        } else if bmiValue < 24.9 {
            bmiAdvice = "Всё отлично, ешь, пей, кайфуй :)"
            bmiColor = .green
        } else {
            bmiAdvice = "Пора начать кушать марковку :)"
            bmiColor = .red
        }
        
        bmi = BMI(value: bmiValue, advice: bmiAdvice, color: bmiColor)
        
    }
    
    
}
