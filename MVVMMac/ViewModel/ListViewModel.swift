//
//  ListModelView.swift
//  MVCMVVM
//
//  Created by Macbook on 10/06/2020.
//  Copyright © 2020 Asal. All rights reserved.


import Foundation
class ListViewModel{
    var data = [User]()
    private var service : UserServiceProtocol
    
    init(service:UserServiceProtocol){
        self.service = service
    }
    func fetchData(completion:@escaping ()->()){
        service.fetchUsers { [weak self] (users) in
            DispatchQueue.main.async {
                self?.data = users
                completion()
            }
        }
    }
    func deleteUserAt(_ index:Int,completion:@escaping ()->()){
        data.remove(at: index)
        completion()
    }
    func addRow(user:User,completion:@escaping ()->()){
        data.append(user)
        completion()
    }
 
  

}
