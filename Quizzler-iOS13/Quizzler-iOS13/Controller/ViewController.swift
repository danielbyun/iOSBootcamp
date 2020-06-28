import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    // initializing
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = quizBrain.quiz[0].text
    }
    
    @IBAction func answerButonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!; // true, false
        //        let actualQuestion = quiz[iteration];
        let didUserGetItCorrect = quizBrain.checkAnswer(userAnswer)
        
        if didUserGetItCorrect {
            // update UI
            sender.backgroundColor = UIColor.green
        } else {
            // update UI
            sender.backgroundColor = UIColor.red
        }
        
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        let percentage = (Float(quizBrain.iteration + 1) / Float(quizBrain.quiz.count))
        
        // progress bar
        progressBar.progress = percentage
        
        // question UI
        questionLabel.text = quizBrain.getQuestionText()
        
        // score progress label UI
        scoreLabel.text = "Score: \(quizBrain.getScore())"

        
        // change color of the button after clicked
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        progressBar.progress = quizBrain.getProgress();
    }
}

