import UIKit

class CalculateViewController: UIViewController {
    var calculatorBrain = CalculatorBrain();
    
    var bmiValue = "0.0";
    
    @IBOutlet weak var heightSliderValue: UISlider!
    @IBOutlet weak var weightSliderValue: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        let heightValue = String(((sender.value * 100).rounded() / 100))
        heightLabel.text = ("\(heightValue)m");
        
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        let weightValue = String(Int(sender.value))
        weightLabel.text = "\(weightValue)kg";
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let heightValue = heightSliderValue.value;
        let weightValue = weightSliderValue.value;
        let newHeightValue = pow(heightValue, 2);
//        bmiValue = String(((weightValue / newHeightValue) * 100).rounded() / 100)
        
        // display second view controller
        // let secondVC = SecondViewController()
        // secondVC.bmiValue = String(format: "%.1f", newBmiValue)
        
        // self.present(secondVC, animated: true, completion: nil)
        
        calculatorBrain.calculateBMI(height: newHeightValue, weight: weightValue);
        // segue
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            // correct segue
            // as is for downcasting
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            
            destinationVC.advice = calculatorBrain.getAdvice();
            destinationVC.color = calculatorBrain.getColor();
        }
    }
}

