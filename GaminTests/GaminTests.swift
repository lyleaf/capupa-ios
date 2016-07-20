//
//  GaminTests.swift
//  GaminTests
//
//  Created by yiling on 7/7/16.
//  Copyright © 2016 yiling. All rights reserved.
//

import XCTest

class GaminTests: XCTestCase {
    
    //MARK: Challenge class Tests
    //tests to confirm that the challenge initializer returns when no title or no details is provided
    func testChalle¨ngeInitialization(){
        //Success case.
        let potentialChallenge = Challenge(title: "New Challenge", image: nil, detail: "Some details")
        XCTAssertNotNil(potentialChallenge)
        
        //Falure cases
        let noTitle = Challenge(title: "", image: nil, detail: "Some details")
        XCTAssertNil(noTitle, "Empty name is invalid")

    }
}
