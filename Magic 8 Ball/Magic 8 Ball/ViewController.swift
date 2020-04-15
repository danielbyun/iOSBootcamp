//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var balls = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")];
    
    // image
    @IBOutlet weak var imageStage: UIImageView!
    
    // button
    @IBAction func askButtonPressed(_ sender: UIButton) {
        let ballArrayCount = balls.count;
        let randomNum = Int.random(in: 0...ballArrayCount - 1);
        
        imageStage.image = balls[randomNum];
    }
    
}

