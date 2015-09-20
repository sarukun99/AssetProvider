//
//  AssetProviderAsset.swift
//  PictZ
//
//  Created by enomoto on 2015/09/20.
//  Copyright © 2015年 sarukun99. All rights reserved.
//

import Foundation
import Photos

class AssetProviderAsset {
    
    init(){}
    
    var pick : Int  = 2
    
    convenience init(asset: PHAsset){
        self.init()
        self.asset = asset
    }
    
    var creationDate : NSDate?{
        return self.asset?.creationDate?.dayDate
    }
    
    func setImage( size:CGSize, complete:((image:UIImage) -> Void)){
        if let asset = self.asset {
            PHImageManager.defaultManager().requestImageForAsset(asset, targetSize: size, contentMode: .AspectFill, options: nil) { (image, info) -> Void in
                
                if let image = image{
                    complete(image:image)
                }
            }
        }
    }
    
    
    private var asset : PHAsset?
    
}