//
//  MVVMMacUITests.swift
//  MVVMMacUITests
//
//  Created by Macbook on 11/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import XCTest

class MVVMMacUITests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        
        let window = XCUIApplication().windows["Window"]
        
        //let tablesQuery = window/*@START_MENU_TOKEN@*/.tables/*[[".groups",".scrollViews.tables",".tables"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        let group = window.children(matching: .group).element(boundBy: 1)
        XCUIApplication().windows["Window"].tables.staticTexts["Leanne Graham"].click()
        XCTAssert(group.staticTexts["Leanne Graham"].exists)
        // XCTAssert(group.staticTexts["staticTexts"])
        XCUIApplication().windows["Window"].tables.staticTexts["Ervin Howell"].click()
        XCTAssert(group.staticTexts["Ervin Howell"].exists)
        
    
        // XCTAssert(group.children(matching: .image).element.exists)
        
    }
    func testPopUp(){
        let app = XCUIApplication()
            app.launch()
        let window = XCUIApplication().windows["Window"]
        let group = window.children(matching: .group).element(boundBy: 1)
        XCTAssert(group.children(matching: .staticText).element.exists)
        XCTAssertFalse(group.children(matching: .image).element.exists)
        window.children(matching: .popUpButton).element.click()
        window/*@START_MENU_TOKEN@*/.menuItems["Images"]/*[[".popUpButtons",".menus.menuItems[\"Images\"]",".menuItems[\"Images\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.click()
        XCTAssert(group.children(matching: .image).element.exists)
        XCTAssertFalse(group.children(matching: .staticText).element.exists)
    }
    
    func testImageCollectionView(){
        let app = XCUIApplication()
                  app.launch()
              let window = XCUIApplication().windows["Window"]
              let group = window.children(matching: .group).element(boundBy: 1)
        window.children(matching: .popUpButton).element.click()
            window/*@START_MENU_TOKEN@*/.menuItems["Images"]/*[[".popUpButtons",".menus.menuItems[\"Images\"]",".menuItems[\"Images\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.click()
            
            let image = group.children(matching: .image).element.screenshot()
            
            print("==> value: \(String(describing: image))")
            let expect = expectation(description: "change images")
            window/*@START_MENU_TOKEN@*/.collectionViews/*[[".groups",".scrollViews.collectionViews",".collectionViews"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.otherElements.children(matching: .group).matching(identifier: "CollectionViewImage").element(boundBy: 2).children(matching: .image).element.click()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3) {
                let image2 = group.children(matching: .image).element.screenshot()
                XCTAssertNotEqual(image2.pngRepresentation, image.pngRepresentation)
                window/*@START_MENU_TOKEN@*/.collectionViews/*[[".groups",".scrollViews.collectionViews",".collectionViews"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.otherElements.children(matching: .group).matching(identifier: "CollectionViewImage").element(boundBy: 1).children(matching: .image).element.click()
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3) {
                    let image3 = group.children(matching: .image).element.screenshot()
                    print("IMAGE 1 = \(image3) AND IMAGE2 = \(String(describing: image2))")
                    XCTAssertNotEqual(image2.pngRepresentation, image3.pngRepresentation)
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1) {
                        let image4 = group.children(matching: .image).element.screenshot()
                        XCTAssertEqual(image4.pngRepresentation, image3.pngRepresentation)
                        expect.fulfill()
                        
                        
                    }
                    
                    
                }
                
                
            }
            
            wait(for: [expect], timeout: 30)
    }
    
}
