//
//  ViewController.swift
//  dicee
//
//  Created by Daniel Byun on 4/11/20.
//  Copyright © 2020 Daniel Byun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    let imageArray = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix") ];
    var leftDice = 0;
    var rightDice = 5;
    
    // trigger action when roll button is clicked
    @IBAction func rollButtonPressed(_ sender: Any) {
        let rightRandom = Int.random(in: 0...5)
        
        diceImageView1.image = imageArray.randomElement();
        diceImageView2.image = imageArray[rightRandom];
        
        // print("length of imageArray \(imageArray.count)")
    }
}

