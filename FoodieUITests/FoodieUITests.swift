//
//  FoodieUITests.swift
//  FoodieUITests
//
//  Created by Alisena Mudaber on 12/11/21.
//

import XCTest
import Foodie

class when_user_clicks_on_next_button_on_onboarding_screen: XCTestCase {
    private var app: XCUIApplication!
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
    }
    
    func test_when_user_clicks_on_next_button() {
        
        let nextButton = app.buttons["nextButton"]
        nextButton.tap() 
        nextButton.tap()
        nextButton.tap()
        
        let homeViewControllerView = app.otherElements["homeViewController"]
        let viewShown = homeViewControllerView.waitForExistence(timeout: 0.5)
        
        XCTAssert(viewShown)
    }
}
