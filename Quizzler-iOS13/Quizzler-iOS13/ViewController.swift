import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var iteration = 0;
    let quiz = [
        ["Four plus two is six", "true"],
        ["whales are savages", "false"],
        ["is scar the villian or are mufasa and their parents the actual villians of the story in the film 'The Lion King'", "true"]
    ]
    
    // initializing
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = quiz[iteration][0];
    }
    
    @IBAction func answerButonPressed(_ sender: UIButton) {
        let quizSize = quiz.count;
        let userAnswer = sender.currentTitle; // true, false
        let actualAnswer = quiz[iteration][1]
        
        if (userAnswer == actualAnswer.capitalized) {
            // update UI
            print("Correct")
        } else {
            // update UI
            print("Incorrect")
        }
    
        if (iteration + 1 < quizSize) {
            iteration += 1;
            updateUI();
        } else if (iteration + 1 == (quizSize)) {
            resetCount();
        }

    }
    
    func updateUI() {
        questionLabel.text = quiz[iteration][0]
    }
    
    func resetCount() {
        iteration = 0;
    }
}

