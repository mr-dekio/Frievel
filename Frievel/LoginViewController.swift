//
//  LoginViewController.swift
//  Frievel
//
//  Created by Maxim Galayko on 11/11/15.
//  Copyright © 2015 Maxim Galayko. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerForKeyboardNotifications()

        loginField.delegate = self
        passwordField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        unregisterForKeyboardNotifications()
    }
    
    // MARK: - Authorization & Login
    
    @IBAction func loginUser(sender: AnyObject) {
        
    }

    @IBAction func signUpUser(sender: AnyObject) {
    }
    
    
    // MARK: - Keyboard
    
    func registerForKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardDidShow:", name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unregisterForKeyboardNotifications() {
        
    }
    
    func keyboardDidShow(notification: NSNotification) {
        let notificationInfo = notification.userInfo
        guard let userInfo = notificationInfo else { return }
        
        let size = userInfo[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue.size
        if let size = size {
            let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: size.height, right: 0)
            print(contentInset)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    

}
