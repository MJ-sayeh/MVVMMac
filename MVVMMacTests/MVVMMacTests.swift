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
    var service: UserServiceProtocol!
    var listViewModel: ListViewModel!
    override func setUp() {
        service = userServiceMock()
        listViewModel = ListViewModel(service:service)
        print("start")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testListViewModel(){
        
        listViewModel.fetchData {
            XCTAssert(self.listViewModel.data == userServiceMock.staticData)
        }
        
        
        
    }
    
    func testListViewModelAdd(){
        listViewModel.fetchData{
            self.listViewModel.addRow(user: userServiceMock.user5) {
                userServiceMock.staticData.append(userServiceMock.user5)
                for i in 0..<self.listViewModel.data.count{
                    XCTAssert(self.listViewModel.data[i] == userServiceMock.staticData[i])
                }
                
            }
        }
        
    }
    
    func testListViewModelDelete(){
        listViewModel.fetchData{
            self.listViewModel.deleteUserAt(0){
                userServiceMock.staticData.remove(at: 0)
                for i in 0..<self.listViewModel.data.count{
                    XCTAssert(self.listViewModel.data[i] == userServiceMock.staticData[i])
                }
            }
        }
    }
}
