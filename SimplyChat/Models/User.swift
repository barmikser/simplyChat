//
//  User.swift
//  SimplyChat
//
//  Created by Ivan Tyurin on 27.04.2020.
//  Copyright © 2020 EPAM Match. All rights reserved.
//

import Foundation
import UIKit

class User: NSObject {
    var id: String?
    var name: String?
    var surname: String?
    var email: String?
    var city: String?
    
    init(dictionary: [String: AnyObject]) {
        self.id = dictionary["id"] as? String
        self.name = dictionary["name"] as? String
        self.surname = dictionary["surname"] as? String
        self.email = dictionary["email"] as? String
        self.city = dictionary["city"] as? String
    }
}
