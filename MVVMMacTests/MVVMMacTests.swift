//
//  MVVMMacTests.swift
//  MVVMMacTests
//
//  Created by Macbook on 11/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import XCTest
@testable import MVVMMac

class MVVMMacTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testListViewModel(){
        let service: UserServiceProtocol = userServiceMock()
        let listViewModel = ListViewModel(service:service)
  
        listViewModel.fetchData {
            XCTAssert(listViewModel.data == userServiceMock.staticData)
        }
        listViewModel.addRow(user: userServiceMock.user5) {
            userServiceMock.staticData.append(userServiceMock.user5)
            for i in 0..<listViewModel.data.count{
                  XCTAssert(listViewModel.data[i] == userServiceMock.staticData[i])
            }
          
        }
        listViewModel.deleteUserAt(0){
            userServiceMock.staticData.remove(at: 0)
                 for i in 0..<listViewModel.data.count{
                         XCTAssert(listViewModel.data[i] == userServiceMock.staticData[i])
                   }
        }
        
    }
}
