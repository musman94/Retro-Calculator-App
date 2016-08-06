//
//  ViewController.swift
//  Retro Calculator
//
//  Created by Muhammad Usman on 06/08/2016.
//  Copyright © 2016 Muhammad Usman. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum Operation:String
    {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
        
    
    }
    
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    
    @IBOutlet weak var outputLbl: UILabel!
    @IBAction func numberPressed(btn: UIButton!)
    {
    
        playSound()
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
        
    }
    
    @IBAction func onDividePressed(sender: AnyObject)
    {
     
     processOperation(Operation.Divide)
        
    }
    
    
    @IBAction func onMultiplyPressed(sender: AnyObject)
    {
        processOperation(Operation.Multiply)
        
    }
    
    
    @IBAction func onSubPressed(sender: AnyObject)
    {
        
        processOperation(Operation.Subtract)
        
    }
    
    
    @IBAction func onAddPressed(sender: AnyObject)
    {
        
        processOperation(Operation.Add)
        
    }
    
    
    @IBAction func onEqualsPressed(sender: AnyObject)
    {
     
            processOperation(currentOperation)
    }
    
    
    func processOperation(op: Operation)
    {
         btnSound.play()
         if currentOperation != Operation.Empty
         {
            
            if runningNumber != ""
            {
            
                rightValStr = runningNumber
                runningNumber = ""
                if currentOperation == Operation.Divide
                {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                }
                else if currentOperation == Operation.Multiply
                {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                }
                    
                else if currentOperation == Operation.Add
                {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                    
                }
                    
                else if currentOperation == Operation.Subtract
                {
                    
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                    
                }
                
                leftValStr = result
                outputLbl.text = result

            
            }
            currentOperation = op

         }
         else
         {
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
        
         }
        
        
    
    }
    
    func playSound()
    {
         if btnSound.playing
         {
            btnSound.stop()
         }
         btnSound.play()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do
        
        {
            try  btnSound = AVAudioPlayer(contentsOfURL: soundURL)
            btnSound.prepareToPlay()
        }catch let err as NSError
        {
            print(err.debugDescription)
        }
        
        outputLbl.text = ""
        
        
       
    }

   
}

