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
    @IBOutlet weak var scrollContentView: UIScrollView!
    
    @IBOutlet weak var keyboardBottomConstraint: NSLayoutConstraint!
    
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
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "adjustKeyboardFrame:", name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "adjustKeyboardFrame:", name: UIKeyboardWillChangeFrameNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "adjustKeyboardFrame:", name: UIKeyboardWillHideNotification, object: nil)
        }
    
    func unregisterForKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func adjustKeyboardFrame(notification: NSNotification) {
        let notificationInfo = notification.userInfo
        guard let userInfo = notificationInfo else { return }
        
        if (notification.name == UIKeyboardWillHideNotification) {
            keyboardBottomConstraint.constant = 0
        } else {
            let size = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue.size
            if let size = size {
                keyboardBottomConstraint.constant = size.height
            }
        }
        
        UIView.animateWithDuration(0.2) { () -> Void in
            self.view.layoutIfNeeded()
        }
    }
    
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    

}
