//
//  RoundButton.swift
//  CalculatoR
//
//  Created by Apple on 17/02/22.
//  Copyright © 2022 MPandya. All rights reserved.
//

import UIKit
@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var buttonRound:Bool = false{
        didSet{
            if buttonRound{
                layer.cornerRadius = frame.height / 2
            }
        }
    }
   
    override func prepareForInterfaceBuilder() {
        if buttonRound{
            layer.cornerRadius = frame.height / 2
        }
    
    }
    
}
