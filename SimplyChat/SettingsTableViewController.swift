//
//  SettingsTableViewController.swift
//  SimplyChat
//
//  Created by Артем Маков on 26/04/2020.
//  Copyright © 2020 EPAM Match. All rights reserved.
//

import UIKit

enum SectionNames: String, CaseIterable {
    case basic = "Basic"
    case extra = "Extra"
}

enum CellNames: String, CaseIterable {
    case notifications = "Notification"
    case about = "About"
}

class SettingsTableViewController: UITableViewController {
    
    var delegate : SettingsTableViewControllerDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if(indexPath.row == 1){
            // tell the delegate (view controller) to perform logoutTapped() function
            if let delegate = delegate {
                delegate.logoutTapped()
            }
        }
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return SectionNames.allCases.count
//    }
//
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
//
//
//        //switch
//        let swicthView = UISwitch(frame: .zero)
//        swicthView.setOn(false, animated: true)
//        swicthView.tag = indexPath.row
//        swicthView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
//
//        cell.accessoryView = swicthView
//
//        return cell
//
//    }
//
//    @objc func switchChanged(_ sender: UISwitch!) {
//
//        print("Table row switch Changed \(sender.tag)")
//        print("The switch is \(sender.isOn ? "ON" : "OFF")")
//
//    }

}

protocol SettingsTableViewControllerDelegate {
  func logoutTapped()
}
