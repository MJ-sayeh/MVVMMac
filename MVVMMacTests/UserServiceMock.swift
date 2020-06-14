//
//  UserServiceMock.swift
//  MVVMMacUITests
//
//  Created by Mohammad Sayeh on 14/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import Foundation
@testable import MVVMMac
class userServiceMock:UserServiceProtocol{
    static var staticData :[User]!
    static var removedUser1: [User]!
    static let user5 = User(id: 1, name: "sayeh5", username: "msayeh5", email: "juma.sayeh5@gmail.com", phone: "0592285825", website: "appers.ps", company: Company(name: "Asal", catchPhrase: "Build the future", bs: "ballshit"), address:Address(street: "beiger", suite: "32", city: "nablus", zipcode: "9715", geo: Location(lat: "32.421512", lng: "35.3215213")))
    static var addedUser5: [User]!
    init(){
        let asal = Company(name: "Asal", catchPhrase: "Build the future", bs: "ballshit")
          let geo =  Location(lat: "32.421512", lng: "35.3215213")
          let address = Address(street: "beiger", suite: "32", city: "nablus", zipcode: "9715", geo: geo)
          let user1 = User(id: 1, name: "sayeh1", username: "msayeh1", email: "juma.sayeh1@gmail.com", phone: "0592285820", website: "appers.ps", company: asal, address:address)
          let user2 = User(id: 1, name: "sayeh2", username: "msayeh2", email: "juma.sayeh2@gmail.com", phone: "0592285821", website: "appers.ps", company: asal, address:address)
          let user3 = User(id: 1, name: "sayeh3", username: "msayeh3", email: "juma.sayeh3@gmail.com", phone: "0592285822", website: "appers.ps", company: asal, address:address)
          let user4 = User(id: 1, name: "sayeh4", username: "msayeh4", email: "juma.sayeh4@gmail.com", phone: "0592285823", website: "appers.ps", company: asal, address:address)
        
        userServiceMock.staticData = [user1,user2,user3,user4]
            
        
    }
    func fetchUsers(completion: @escaping (([User]) -> ())) {
        completion(userServiceMock.staticData)
    }
    
    
}
