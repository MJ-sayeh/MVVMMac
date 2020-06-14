//
//  UsersService.swift
//  MVVMMac
//
//  Created by Mohammad Sayeh on 14/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import Foundation
class UsersService:UserServiceProtocol{
    func fetchUsers(completion: @escaping (([User]) -> ())) {
        _ = HttpUtil.getData(url: "https://jsonplaceholder.typicode.com/users"){ data in
             do {
                 let users = try JSONDecoder().decode([User].self, from: data)
                 completion(users)
             }catch {
                print(error.localizedDescription)
             }
         }
    }
    

    
    
}
