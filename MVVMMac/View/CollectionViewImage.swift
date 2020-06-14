//
//  CollectionViewImage.swift
//  MVVMMac
//
//  Created by Macbook on 11/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import Cocoa

class CollectionViewImage: NSCollectionViewItem {

    var request: URLSessionDataTask!
    var image: Image!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    func setImage(_ image: Image){
        guard let imageView = self.imageView else{
            return
        }
            self.image = image
            imageView.image = nil
            if let request = self.request{
                request.cancel()
            }
        request = Utilities.getImageWithTaskReference(image.thumbnailUrl,completion: { [weak self](nsImage) in
                DispatchQueue.main.async {[weak imageView] in
                    imageView?.image = nsImage
                    self?.imageView = nil
                }
                
                
            })
        }
    
       
    
}
