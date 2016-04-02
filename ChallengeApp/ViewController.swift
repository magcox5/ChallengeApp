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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the delegates
        self.zipCodeTextField.delegate = ZipCodeDelegate()
        self.cashTextField.delegate = CashTextDelegate()
        self.lockableTextField.delegate = self
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

