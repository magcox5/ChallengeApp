//
//  ZipCodeTextFieldDelegate.swift
//  ChallengeApp
//
//  Created by Molly Cox on 4/2/16.
//  Copyright © 2016 Molly Cox. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeDelegate: NSObject, UITextFieldDelegate{
    
    let digits = NSCharacterSet.decimalDigitCharacterSet()

    //TODO:  Allow 5 digits exactly

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // Figure out what the new text will be, if we return true
        var newText: NSString = textField.text!
        let newString = String(newText)
        print(newString)
        print(newString.characters.count)
        if digitsOnly(newString) {
            print("Only Digits")
            if newString.characters.count < 5 {
                print("< 6 chars")
            newText = newText.stringByReplacingCharactersInRange(range, withString: string)
            print(newText)
            }
            else {
                print("> 5 chars")
                    newText = newText.stringByReplacingCharactersInRange(NSMakeRange(0,5), withString: string)
            }
            
        }
//        textField.text = newText as String
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        let newText: String = textField.text!
        if newText.characters.count == 5 {
            return true
        } else {
            
            return false
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let newText: String = textField.text!
        if newText.characters.count == 5 {
            return true
        } else {
            return false
        }
    }
    


    
    func digitsOnly(word: String) -> Bool {
        for character in word.unicodeScalars {
            if !digits.longCharacterIsMember(character.value) {
                return false
            }
        }
        return true
    }
    
}
