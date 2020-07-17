import UIKit
// VERY INEFFICIENT

// created own view controller from scratch
class SecondViewController: UIViewController {
    var bmiValue = "0.0";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // background color (shortcut by not having to include UIColor)
        view.backgroundColor = .red
        
        let label = UILabel();
        label.text = bmiValue
        
        // CGRect
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        // put label on screen (by accessing View)
        view.addSubview(label)
    }
    
}
