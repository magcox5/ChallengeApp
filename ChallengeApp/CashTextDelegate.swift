//
//  CashTextDelegate.swift
//  ChallengeApp
//
//  Created by Molly Cox on 4/2/16.
//  Copyright © 2016 Molly Cox. All rights reserved.
//

import Foundation
import UIKit

class CashTextDelegate: NSObject, UITextFieldDelegate{
    
    let digits = NSMutableCharacterSet.decimalDigitCharacterSet()

    
    //TODO:  Allow only digits convert to $ format
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // Figure out what the new text will be, if we return true
        var newText: NSString = textField.text!
        var newString = String(newText)
        let charCount = newString.characters.count
        print(newString)
        print(charCount)
        if cashCharactersOnly(newString) {
            print("Only Money")
            if charCount == 1 {
                textField.text = "$0.0" + newString
                return false
            } else {
                // more than one character, so need to make into a number first, then form the $ string
                let cashRange = NSMakeRange (2, charCount)
                newText = newText.stringByReplacingCharactersInRange(cashRange, withString: string)
                newString = String(newText)
                var tempDouble = Double(newString)
                tempDouble = tempDouble! * 1000
                let tempInt = Int(tempDouble!)
                switch tempInt {
                case 1...9 :
                    textField.text = "$0.0" + String(tempInt)
                case 10...99:
                    textField.text = "$0." + String(tempInt)
                default:
                    let tempDollars = Int(round(tempDouble!/100))
                    let tempPennies = Int(tempInt % 100)
                    textField.text = "$" + String(tempDollars) + "." + String(tempPennies)
                return false
                }
                
            }
                
        }
        else {
            print("Invalid Characters")
            return false
        }
        return true
}
    
    
    func cashCharactersOnly(word: String) -> Bool {
        for character in word.unicodeScalars {
            let charName = Character(character)
            if !digits.longCharacterIsMember(character.value) {
                if charName == "$" || charName == "." {
                    return true
                } else {
                    return false
                }
                
                            }
        }
        return true
    }
    
}