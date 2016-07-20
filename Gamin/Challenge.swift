//
//  Challenge.swift
//  Gamin
//
//  Created by yiling on 7/17/16.
//  Copyright © 2016 yiling. All rights reserved.
//

//redudant :import Foundation
import UIKit

class Challenge {
    //MARK: Properties
    var title: String
    var image: UIImage?
    var detail: String
    
    //MARK: Initialization
    init?(title: String, image: UIImage?, detail: String){ //possible to return nil: failable initializer
        self.title = title
        self.image = image
        self.detail = detail
        
        if title.isEmpty || detail.isEmpty {
            return nil
        }
    }
    
}