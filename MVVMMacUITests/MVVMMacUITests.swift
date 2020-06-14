//
//  MVVMMacUITests.swift
//  MVVMMacUITests
//
//  Created by Macbook on 11/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import XCTest

class MVVMMacUITests: XCTestCase {
    let app = XCUIApplication()
    var window :XCUIElement!
    var group : XCUIElement!
    override func setUp() {
        app.launch()
        window = XCUIApplication().windows["Window"]
        group = window.children(matching: .group).element(boundBy: 1)
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        window = nil
        group = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // UI tests must launch the application that they test.
        
        XCUIApplication().windows["Window"].tables.staticTexts["Leanne Graham"].click()
        XCTAssert(group.staticTexts["Leanne Graham"].exists)
        // XCTAssert(group.staticTexts["staticTexts"])
        XCUIApplication().windows["Window"].tables.staticTexts["Ervin Howell"].click()
        XCTAssert(group.staticTexts["Ervin Howell"].exists)
        
        
        // XCTAssert(group.children(matching: .image).element.exists)
        
    }
    func testPopUp(){
        XCTAssert(group.children(matching: .staticText).element.exists)
        XCTAssertFalse(group.children(matching: .image).element.exists)
        window.children(matching: .popUpButton).element.click()
        window/*@START_MENU_TOKEN@*/.menuItems["Images"]/*[[".popUpButtons",".menus.menuItems[\"Images\"]",".menuItems[\"Images\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.click()
        XCTAssert(group.children(matching: .image).element.exists)
        XCTAssertFalse(group.children(matching: .staticText).element.exists)
    }
    
    func testImageCollectionView(){
        
        window.children(matching: .popUpButton).element.click()
        window/*@START_MENU_TOKEN@*/.menuItems["Images"]/*[[".popUpButtons",".menus.menuItems[\"Images\"]",".menuItems[\"Images\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.click()
        let image1 = getDataOfImageAt(0)
        let image2 = getDataOfImageAt(1)
        XCTAssertNotEqual(image1, image2)
        let image3 = getDataOfImageAt(0)
        XCTAssertEqual(image3, image1)
    }
    func getDataOfImageAt(_ index: Int)->Data{
        let expect = expectation(description: "change images")
        window.collectionViews.otherElements.children(matching: .group).element(boundBy: index).children(matching: .image).element.click()
        var image:XCUIScreenshot!
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3) {
        image = self.group.children(matching: .image).element.screenshot()
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 5)
        return image.pngRepresentation
    }
}
