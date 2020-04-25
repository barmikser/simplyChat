//
//  ViewController.swift
//  SimplyChat
//
//  Created by Mihail Barinov on 24/04/2020.
//  Copyright © 2020 EPAM Match. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if Core.shared.isNewUser() {
            //show
            guard let vc = storyboard?.instantiateViewController(identifier: "welcome") as? WelcomeViewController else {
                return
            }
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
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
