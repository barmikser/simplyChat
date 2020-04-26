//
//  ProflleViewController.swift
//  SimplyChat
//
//  Created by Артем Маков on 26/04/2020.
//  Copyright © 2020 EPAM Match. All rights reserved.
//

import UIKit

class ProflleViewController: UIViewController {

    @IBOutlet weak var actionBarButton:UIBarButtonItem!
    @IBOutlet weak var shareBarButton:UIBarButtonItem!
    @IBOutlet weak var titleBarItem:UINavigationItem!
    @IBOutlet weak var pictureProfile: UIImageView!
    @IBOutlet weak var statusTitle: UILabel!
    
    var tableViewController : SettingsTableViewController?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableViewController = self.children[0] as? SettingsTableViewController
        tableViewController?.delegate = self
    }
    
    @IBAction func onExtraButtonClick(_ sender: Any) {
        showSimpleActionSheet(controller: self)
    }
    
    
}


extension ProflleViewController{
    func showSimpleActionSheet(controller: UIViewController) {
        let alert = UIAlertController(title: "Extra", message: "Additional option for interating with profile", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Approve", style: .default, handler: { (_) in
            print("User click Approve button")
        }))

        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: { (_) in
            print("User click Edit button")
        }))

        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (_) in
            print("User click Delete button")
        }))

        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
            print("User click Dismiss button")
        }))

        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}

extension ProflleViewController : SettingsTableViewControllerDelegate  {
    // do stuff here
    func logoutTapped() {
        print("logout tapped")
    }
}
