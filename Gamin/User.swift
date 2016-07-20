//
//  User.swift
//  Gamin
//
//  Created by yiling on 7/17/16.
//  Copyright © 2016 yiling. All rights reserved.
//

import UIKit

class User {
    //MARK: Properties
    var name: String
    var nationality: String?
    var email: String
    var finishedChallengeIDs: Array<String>?
    var onGoingChallengeIDs: Array<String>?
    var image: UIImage?
    
    //MARK: Initialization
    init?(name: String, nationality: String, email: String, finishedChallengeIDs: Array<String>, onGoingChallengeIDs: Array<String>, image: UIImage?){ //possible to return nil: failable initializer
        self.name = name
        self.nationality = nationality
        self.email = email
        self.finishedChallengeIDs = finishedChallengeIDs
        self.onGoingChallengeIDs = onGoingChallengeIDs
        self.image = image
        
        if name.isEmpty || email.isEmpty {
            return nil
        }
    }
    
}