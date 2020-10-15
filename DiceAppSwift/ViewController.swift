//
//  ViewController.swift
//  DiceAppSwift
//
//  Created by Miranda Ramirez Cospin on 10/13/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView: UIImageView!
    @IBOutlet var criticalLabel: UILabel!
    
    var rollDiceSound: AVAudioPlayer?
    var failSound: AVAudioPlayer?
    var winSound: AVAudioPlayer?
    var launchSound: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let launchPath = Bundle.main.path(forResource: "torpedo.mp3", ofType:nil)!
        let launchurl = URL(fileURLWithPath: launchPath)
        do {
            launchSound = try AVAudioPlayer(contentsOf: launchurl)
            launchSound?.play()
        } catch {
            // fail to load file
        }
        
        let rollPath = Bundle.main.path(forResource: "rolldice.mp3", ofType:nil)!
        let rollurl = URL(fileURLWithPath: rollPath)
        do {
            rollDiceSound = try AVAudioPlayer(contentsOf: rollurl)
            rollDiceSound?.play()
        } catch {
            // fail to load file
        }
        
        let winPath = Bundle.main.path(forResource: "zfanfare.mp3", ofType:nil)!
        let winurl = URL(fileURLWithPath: winPath)
        do {
            winSound = try AVAudioPlayer(contentsOf: winurl)
        } catch {
            // fail to load file
        }
        
        let failPath = Bundle.main.path(forResource: "failwah.mp3", ofType:nil)!
        let failurl = URL(fileURLWithPath: failPath)
        do {
            failSound = try AVAudioPlayer(contentsOf: failurl)
        } catch {
            // fail to load file
        }
        
    }
    
    @IBAction func buttonGotPressed(){
        rollDice()
    }
    
    func rollDice(){
        //dice stuff here
        print("ROLLING DICE!!!")
        
        let rolledNumber = Int.random(in: 1...20)
        
        let imageName = "d\(rolledNumber)"
        
        diceImageView.image = UIImage(named: imageName)
        
        rollDiceSound?.play()
        
        if(imageName == "d1"){
            criticalLabel.text = "TRY AGAIN!!!"
            failSound?.play()
        } else if (imageName == "d20"){
            criticalLabel.text = "CONGRATS!!!"
            winSound?.play()
        }else{
            criticalLabel.text = ""
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }
    
    


}

