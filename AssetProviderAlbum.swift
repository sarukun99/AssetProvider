//
//  AssetProviderCollection.swift
//  PictZ
//
//  Created by enomoto on 2015/09/20.
//  Copyright © 2015年 sarukun99. All rights reserved.
//

import Foundation
import Photos

class AssetProviderAlbum{
    
    init(){}
    
    convenience init(collection : PHAssetCollection) {
        self.init()
        self.collection = collection
    }
    
    func fetchAssets( predicate : NSPredicate?) -> [AssetProviderAsset] {
        
        var assets = [AssetProviderAsset]()
        let option = PHFetchOptions()
        
        if let predicate = predicate {
            option.predicate = predicate
        }
        
        if let collection = self.collection {
            PHAsset.fetchAssetsInAssetCollection(collection, options: option).enumerateObjectsUsingBlock({ (asset, index, stopFlag) -> Void in
                if let asset = asset as? PHAsset {
                    assets.append(AssetProviderAsset(asset:asset))
                }
            })
        }
        return assets
    }

    private var collection : PHAssetCollection?
    
    private var assets = [AssetProviderAsset]()
}