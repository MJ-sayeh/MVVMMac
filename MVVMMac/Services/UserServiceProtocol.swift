//
//  UserServiceProtocol.swift
//  MVVMMac
//
//  Created by Mohammad Sayeh on 14/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import Foundation
protocol UserServiceProtocol {
    func fetchUsers(completion: @escaping ( ([User]) -> () ) )
    //get set update etc etc ..
}
