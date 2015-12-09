//
//  SignupViewController.swift
//  Frievel
//
//  Created by Maxim Galayko on 12/8/15.
//  Copyright © 2015 Maxim Galayko. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textFields: [UITextField]!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBarHidden = false
        
        for item in textFields {
            item.delegate = self
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func addUser(sender: AnyObject) {
        let credentials = UserCredentials(username: usernameTextField.text ?? "", password: passTextField.text ?? "", email: emailTextField.text ?? "")
        
        let user = UserProfile(name: nameTextField.text ?? "", surname: surnameTextField.text ?? "", avatar: nil, level: Int(arc4random_uniform(80)), rating: Int(arc4random_uniform(80)), credentials: credentials)
        UserManager.sharedInstance.users.append(user)
        
        if passTextField.text == "" || passTextField.text != confirmTextField.text {
            let alert = UIAlertController(title: "error", message: "passwords are incorrect", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            let loginController = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewControllerWithIdentifier("LoginControllerStoryboardIdentifier")
            self.presentViewController(loginController, animated: true, completion: nil)
        }
    }
}