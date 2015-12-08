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



//class UserCredentials {
//    var username: String
//    var password: String
//    var email: String
//    
//    init (username: String, password: String, email: String) {
//        self.username = username
//        self.password = password
//        self.email = email
//    }
//}
//
//class UserProfile: NSObject {
//    var name: String = ""
//    var surname: String?
//    var avatar: UIImage?
//    var level: Int
//    var rating: Int
//    var credentials: UserCredentials
//    
//    var fullname: String {
//        guard let surname = surname else { return name }
//        return name + " " + surname
//    }
//    
//    init(name: String, surname: String, avatar: UIImage?, level: Int, rating: Int, credentials: UserCredentials) {
//        self.name = name
//        self.surname = surname
//        self.avatar = avatar ?? UIImage(named: "user")
//        self.level = level
//        self.rating = rating
//        self.credentials = credentials
//    }
//    
//}