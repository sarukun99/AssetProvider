//
//  AssetProviderGroup.swift
//  PictZ
//
//  Created by enomoto on 2015/09/20.
//  Copyright © 2015年 sarukun99. All rights reserved.
//

import Foundation

class AssetProviderGroup {
    
    init(){}
    
    convenience init(assets: [AssetProviderAsset]) {
        self.init()
        self.assets = assets
    }
    
    subscript(index: Int) -> AssetProviderAsset?{
        return assets?[index]
    }
    
    var count : Int {
        return assets?.count ?? 0
    }
    
    private var assets : [AssetProviderAsset]?
}