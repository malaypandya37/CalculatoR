//
//  ViewController.swift
//  CalculatoR
//
//  Created by Apple on 17/02/22.
//  Copyright © 2022 MPandya. All rights reserved.
//

import UIKit

enum Operation : String{
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    case empty = "empty"
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = "0"
    }

    @IBOutlet var answerLabel: UILabel!
    
    var runningNumber = ""
    var leftVal = ""
    var rightVal = ""
    var result = ""
    var currentOperation : Operation = .empty
    
    @IBAction func zeroPressed(_ sender: RoundButton) {
        if runningNumber.count <= 15{
        runningNumber += "\(sender.tag)"
        answerLabel.text = runningNumber
        }
    }
    @IBAction func dotPressed(_ sender: RoundButton) {
        if runningNumber.count <= 14{
        runningNumber += "."
        answerLabel.text = runningNumber
        }
    }
    @IBAction func allClearPressed(_ sender: RoundButton) {
        runningNumber = ""
        leftVal = ""
        rightVal = ""
        currentOperation = .empty
        result = ""
        answerLabel.text = "0"
    }
    @IBAction func dividePressed(_ sender: RoundButton) {
        
        operation(operation: .divide)
        
    }
    
    @IBAction func multiplyPressed(_ sender: RoundButton) {
        
        operation(operation: .multiply)
        
    }
    
    @IBAction func subtractPressed(_ sender: RoundButton) {
        
        operation(operation: .subtract)
        
    }
    
    @IBAction func addPressed(_ sender: RoundButton) {
        
        operation(operation: .add)
        
    }
    @IBAction func equalsPressed(_ sender: RoundButton) {
        
        operation(operation: currentOperation)
        
    }
    func operation (operation : Operation){
        if currentOperation != .empty{
            if runningNumber != ""{
                rightVal = runningNumber
                runningNumber = ""
                
                if currentOperation == .add{
                    result = "\(Double(leftVal)! + Double(rightVal)!)"
                }else if currentOperation == .subtract{
                    result = "\(Double(leftVal)! - Double(rightVal)!)"
                }else if currentOperation == .divide{
                    result = "\(Double(leftVal)! / Double(rightVal)!)"
                }else if currentOperation == .multiply{
                    result = "\(Double(leftVal)! * Double(rightVal)!)"
                }
                leftVal = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int(Double(result)!))"
                }
                answerLabel.text = result
            }
            currentOperation = operation
        }else{
            leftVal = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
}

