//
//  LoginController.swift
//  MatchAuth
//
//  Created by Ivan Tyurin on 26.04.2020.
//  Copyright © 2020 Ivan Tyurin. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

@IBDesignable class LoginController: UIViewController {
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var segmentControllerState: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrationButton.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
    }
    
    
    func handleLogin() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                print(error!)
            }
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func handleRegistration() {
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
            print("Form is not valid")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                print(error!)
                return
            }
            
            let ref = Database.database().reference(fromURL: "https://match-c80a8.firebaseio.com/")
            
            guard let uid = authResult?.user.uid else {return }
            let usersReference = ref.child("users").child(uid)
            
            let values = ["name": name, "email": email]
            
            usersReference.updateChildValues(values, withCompletionBlock: { (errorDB, ref) in
                if errorDB != nil {
                    print(errorDB!)
                    return
                }
                print("User added successfully")
                self.dismiss(animated: true, completion: nil)
            })
        }
    }
    
    @IBAction func selectorChange(_ sender: UISegmentedControl) {
        let title = sender.titleForSegment(at: sender.selectedSegmentIndex)
        registrationButton.setTitle(title, for: .normal)
        if sender.selectedSegmentIndex == 1 {
            nameTextField.isHidden = false
        } else {
            nameTextField.isHidden = true
        }
    }
    
    @IBAction func handleLoginRegistrationPressed(_ sender: UIButton) {
        if segmentControllerState.selectedSegmentIndex == 0 {
            handleLogin()
        } else {
            handleRegistration()
        }
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
