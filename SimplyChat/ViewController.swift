//
//  ViewController.swift
//  SimplyChat
//
//  Created by Mihail Barinov on 24/04/2020.
//  Copyright © 2020 EPAM Match. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var forgotButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if Core.shared.isNewUser() {
            //show
            guard let welcomeVC = storyboard?.instantiateViewController(identifier: "welcome") as? WelcomeViewController else {
                return
            }
            welcomeVC.modalPresentationStyle = .fullScreen
            present(welcomeVC, animated: true)
        }
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let emailText = email.text, let pass = password.text else { return }
        Auth.auth().signIn(withEmail: emailText, password: pass) { (authData, error) in
            if error != nil {
                print(error!)
                return
            }
        }
        Core.shared.setIsNotNewUser()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        forgotButton.isHidden = true
        loginButton.isHidden = true
        signUpButton.isHidden = true
        
        nameTextField.isHidden = false
        surnameTextField.isHidden = false
        cityTextField.isHidden = false
        registrationButton.isHidden = false
    }
    
    @IBAction func registrationButton(_ sender: UIButton) {
        guard let emailText = email.text, let pass = password.text, let name = nameTextField.text, let surname = surnameTextField.text, let city = cityTextField.text else { return }
        
        Auth.auth().createUser(withEmail: emailText, password: pass) { (authResult, error) in
            if error != nil {
                print(error!)
                return
            }
            
            let refDB = Database.database().reference(fromURL: "https://match-c80a8.firebaseio.com/")
            
            guard let uid = authResult?.user.uid else { return }
            let userReference = refDB.child("users").child(uid)
            
            let values = ["email": emailText, "name": name, "surname": surname, "city": city]
            userReference.updateChildValues(values, withCompletionBlock: { (errorDB, reference) in
                if errorDB != nil {
                    print(errorDB!)
                    return
                }
                self.dismiss(animated: true, completion: nil)
            })
        }
    }
    
    
}

class Core {
    static let shared = Core()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
