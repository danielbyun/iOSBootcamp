//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // button
    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.5;
        
        UIView.animate(withDuration: 0.5) {
            sender.alpha = 1.0
        }
        
        // get title value of all buttons
        if let buttonTitle = sender.title(for: .normal) {
            // play the sound for each note
            playSound(note: buttonTitle);
        }
    }
    
    
    // sound playing function
    func playSound(note: String) {
        guard let url = Bundle.main.url(forResource: note, withExtension: "wav") else { return }
        
        do {
            // playback happens even when in silent mode
            // need to set the specific category to the session
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly */
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            // not supporting any devices that run iOS 10 and ealier.
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

