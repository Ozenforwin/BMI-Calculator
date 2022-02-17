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
    
    func getImage() -> String {
        return bmi?.image ?? "pencil"
    }
    
    mutating func calculateBMI(weight: Float, height: Float) {
        
        let bmiValue = weight / pow(height,2)
        let bmiAdvice: String
        let bmiColor: UIColor
        let bmiImage: String
        
        if bmiValue < 18.5 {
            bmiAdvice = "Надо больше кушац :)"
            bmiColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) //79D6F9
            bmiImage = "underweight"
        } else if bmiValue < 24.9 {
            bmiAdvice = "Всё отлично, ешь, пей, кайфуй :)"
            bmiColor = #colorLiteral(red: 0.4472287297, green: 0.9605662227, blue: 0, alpha: 1) //95F200
            bmiImage = "normal"
        } else {
            bmiAdvice = "Пора начать кушать марковку :)"
            bmiColor = #colorLiteral(red: 0.8666666667, green: 0.168627451, blue: 0.03921568627, alpha: 1) //DD2B0A
            bmiImage = "overweight"
        }
        
        bmi = BMI(value: bmiValue, advice: bmiAdvice, color: bmiColor, image: bmiImage)
        
    }
}
