//
//  User.swift
//  PlayDateGroupMessenger
//
//  Created by Steve Lester on 2/5/18.
//  Copyright © 2018 Steve Lester. All rights reserved.
//

import UIKit
import Firebase

class User: NSObject {
    var id: String?
    var name: String?
    var email: String?
    var profileImageUrl: String?
    init(dictionary: [String: AnyObject]) {
        self.id = dictionary["id"] as? String
        self.name = dictionary["name"] as? String
        self.email = dictionary["email"] as? String
        self.profileImageUrl = dictionary["profileImageUrl"] as? String
    }
}
