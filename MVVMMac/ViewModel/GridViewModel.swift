//
//  GridModelView.swift
//  MVCMVVM
//
//  Created by Macbook on 10/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import Foundation
class GridViewModel{
    var data = [Image]()
    var delegate : GridViewModelDelegate?
    func getData(){
        getImages { [weak self] (images) in
            DispatchQueue.main.async {
                self?.data = images
                self?.notifyDelegates()
                
            }
        }
    }
    func notifyDelegates(){
        delegate?.onGridDataUpdate()
    }
}
protocol GridViewModelDelegate:class{
    func onGridDataUpdate()
}
