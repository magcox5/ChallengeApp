//
//  ViewController.swift
//  ChallengeApp
//
//  Created by Molly Cox on 4/1/16.
//  Copyright © 2016 Molly Cox. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Outlets
    
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockableTextField: UITextField!
    @IBOutlet weak var lockableTextFieldSwitch: UISwitch!

    // Text Field Delegate objects
    let zipCodeDelegate = ZipCodeDelegate()
    let cashTextDelegate = CashTextDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lockableTextFieldSwitch.enabled = false
        // Set the delegates
        self.zipCodeTextField.delegate = zipCodeDelegate
        self.cashTextField.delegate = cashTextDelegate
        self.lockableTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if zipCodeTextField.text! != "" && cashTextField.text! != "" {
            lockableTextFieldSwitch.setOn(true, animated:true)
            return true
        } else {
            lockableTextFieldSwitch.setOn(false, animated:true)
            return false
        }
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // TODO:  Allow addition if switch is on
        var newText: NSString
        
        // Construct the text that will be in the field if this change is accepted
        if lockableTextFieldSwitch.on {
            newText = textField.text!
            newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        }
        return true
    }

    
}

