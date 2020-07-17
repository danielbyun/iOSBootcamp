import Foundation
import UIKit

// new struct called calculator brain
struct CalculatorBrain {
    var calculatedValue: BMI?
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", calculatedValue?.value ?? 0.0);
        return bmiTo1DecimalPlace;
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = (((weight / height) * 100).rounded() / 100)
        
        if (bmiValue < 18.5) {
            calculatedValue = BMI(value: bmiValue, advice: "Eat more pies", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if (bmiValue >= 19.5 && bmiValue <= 24.9) {
            calculatedValue = BMI(value: bmiValue, advice: "Fit af", color: #colorLiteral(red: 1, green: 0.7843137255, blue: 0.9803921569, alpha: 1))
        } else if (bmiValue > 24.9) {
            calculatedValue = BMI(value: bmiValue, advice: "Eat less pies", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        }
    }
    
    func getAdvice() -> String {
        return calculatedValue?.advice ?? "No Advice";
    }
    
    func getColor() -> UIColor {
        return calculatedValue?.color ?? #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1);
    }
}
