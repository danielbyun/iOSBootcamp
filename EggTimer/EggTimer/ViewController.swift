import UIKit
import AVFoundation

var alarmPlayer: AVAudioPlayer?

class ViewController: UIViewController {
    // dictionary (aka object but with square bracket)
    let eggTimes = [
        "Soft": 3,
        "Medium": 4,
        "Hard": 7
    ]
    var totalTime = 0;
    var secondsPassed = 0;
    
    var timer = Timer();
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func HardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!;
        
        timer.invalidate()
        progressBar.progress = 0.0;
        secondsPassed = 0;
        label.text = hardness
        
        totalTime = eggTimes[hardness]!
        
        // time object
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    // update function
    @objc func update() {
        if secondsPassed < totalTime {
            let percentage = (Float(secondsPassed) / Float(totalTime))
            
            secondsPassed += 1
            progressBar.progress = (percentage);
        } else {
            progressBar.progress = 1.0;
            timer.invalidate()
            label.text = "Done!"
            playAlarmSound();
        }
    }
    
    func playAlarmSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

           do {
               try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
               try AVAudioSession.sharedInstance().setActive(true)

               /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                alarmPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

               /* iOS 10 and earlier require the following line:
               player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

               guard let player = alarmPlayer else { return }

               player.play()
           } catch let error {
               print(error.localizedDescription)
           }
    }
}
