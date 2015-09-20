//
//  AssetProviderGroupBy.swift
//  PictZ
//
//  Created by enomoto on 2015/09/20.
//  Copyright © 2015年 sarukun99. All rights reserved.
//

import Foundation

/*
class AssetProviderGroupBy {

    class func groupBy(key: String?, assets : [AssetProviderAsset] ) -> [AssetProviderGroup] {
        
        var groups = [String:[AssetProviderAsset]]()
        
        assets.forEach { (asset) -> () in
            let key = asset.value(key)
            
            if var group = groups[key] {
                group.append(asset)
            }
            
            groups[key] = [AssetProviderAsset]()
            groups[key]!.append(asset)
        }
        return groups.flatMap({ (key,assets) -> AssetProviderGroup in
            return AssetProviderGroup(assets:assets)
        })
    }
}*/