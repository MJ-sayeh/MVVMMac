//
//  TableCellView.swift
//  MVVMMac
//
//  Created by Macbook on 11/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import Cocoa

class TableCellView: NSTableCellView {
     var user:User!
    @IBOutlet weak var contentView: NSView!
    @IBOutlet weak var optionalDescription: NSTextField!
    @IBOutlet weak var website: NSTextField!
    @IBOutlet weak var name: NSTextField!
    @IBOutlet weak var stack: NSStackView!
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    func setUser(_ user:User,showBottom:Bool){
           self.user = user
           
           name.stringValue = user.name
           website.stringValue = user.website
           optionalDescription.stringValue = user.phone
           if(showBottom){
               if(!stack.subviews.contains(optionalDescription)){
                   stack.insertArrangedSubview(optionalDescription, at: stack.subviews.count)
                   optionalDescription.isHidden = false
               }
           }else{
               if(stack.subviews.contains(optionalDescription)){
                   stack.removeArrangedSubview(optionalDescription)
                   optionalDescription.isHidden = true
               }
           }
        
        contentView.layout()
       }
       
}
