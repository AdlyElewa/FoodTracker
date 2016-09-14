//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Adly Elewa on 9/9/16.
//  Copyright © 2016 Adly Elewa. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // MARK: FoodTracker Tests
    
    // Test to confirm taht the Meal initializer teturans when no name or a negative rating is provided.
    
    func testMealInitalization() {
        
        // Success case.
        
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)

    
        // Failure cases.
    
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNotNil(noName, "Empty name is invalid")
        
        
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNotNil(badRating, "Negative ratings are invalid, be positive")
    
    }
}
