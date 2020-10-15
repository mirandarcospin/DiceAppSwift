//
//  ViewController.swift
//  DiceAppSwift
//
//  Created by Miranda Ramirez Cospin on 10/13/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView: UIImageView!
    @IBOutlet var criticalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonGotPressed(){
        rollDice()
    }
    
    func rollDice(){
        //dice stuff here
        print("ROLL DICE!!!")
        
        let rolledNumber = Int.random(in: 1...20)
        
        let imageName = "d\(rolledNumber)"
        
        diceImageView.image = UIImage(named: imageName)
        
        if(imageName == "d1"){
            criticalLabel.text = "TRY AGAIN!!!"
        } else if (imageName == "d20"){
            criticalLabel.text = "CONGRATS!!!"
        }else{
            criticalLabel.text = ""
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }
    
    


}

