//
//  Utilities.swift
//  MVVMMac
//
//  Created by Macbook on 11/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import Foundation
import Cocoa
class Utilities{
   static func getImage(_ url : String,completion:@escaping(NSImage)->()){
          _ = HttpUtil.getData(url: url) { (data) in
              if let image = NSImage(data: data){
                  completion(image)
              }
          }
      }
    static func getImageWithTaskReference(_ thumbnailUrl : String,completion:@escaping(NSImage)->())->URLSessionDataTask{
           return HttpUtil.getData(url: thumbnailUrl) { (data) in
                if let image = NSImage(data: data){
                     completion(image)
                }
            }
        }
}
