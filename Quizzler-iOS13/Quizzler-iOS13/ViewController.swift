import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var iteration = 0;
    let quiz = [
        "Four plus two is six",
        "whales are mammals",
        "is scar the villian or are mufasa and their parents the actual villians of the story in the film 'The Lion King'"
    ]
    
    // initializing
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = quiz[iteration];
    }
    
    @IBAction func answerButonPressed(_ sender: UIButton) {
        iteration += 1;
        updateUI();

    }
    
    func updateUI() {
        let quizSize = quiz.count;
        
        if (iteration == quizSize) {
            trueButton.isEnabled = false;
            falseButton.isEnabled = false;
            return;
        } else {
            questionLabel.text = quiz[iteration]
        }
    }
}

