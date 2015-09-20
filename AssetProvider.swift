//
//  AssetProvider.swift
//  PictZ
//
//  Created by enomoto on 2015/09/20.
//  Copyright © 2015年 sarukun99. All rights reserved.
//

import Foundation
import Photos

class AssetProvider {
    
    private var _collections : [AssetProviderGroup]?
    
    private var collections : [AssetProviderGroup]{
        
        if let collections = self._collections {
            return collections
        }
        
        var assets = [AssetProviderAsset]()
        self.albums.forEach { (album) -> () in
            assets += album.fetchAssets(self._where)
        }
        
        guard let _ = self._groupBy else{
            self._collections = [AssetProviderGroup(assets:assets)]
            return self._collections!
        }
        
        self._collections = assets.groupBy(self._groupBy!)
        .flatMap({ (assets) -> AssetProviderGroup in
            return AssetProviderGroup(assets:assets)
        })
        
        self._collections = self._collections?.sort{ (lhs, rhs) in return lhs.creationDate < rhs.creationDate }
        return self._collections!
    }
    
    private var albums : [AssetProviderAlbum]{
        
        var albums = [AssetProviderAlbum]()
        
        
        PHAssetCollection.fetchAssetCollectionsWithType(.Album, subtype: .Any, options: nil).enumerateObjectsUsingBlock { (collection, index, stopFlag) -> Void in
            if let collection = collection as? PHAssetCollection {
                albums.append(AssetProviderAlbum(collection: collection))
            }
        }
        
        
        PHAssetCollection.fetchAssetCollectionsWithType(.SmartAlbum, subtype: .Any, options: nil).enumerateObjectsUsingBlock { (collection, index, stopFlag) -> Void in
            if let collection = collection as? PHAssetCollection {
                albums.append(AssetProviderAlbum(collection: collection))
            }
        }
        return albums
    }
    
    private var _where   : NSPredicate?
    private var _groupBy : ((asset: AssetProviderAsset)->String)?
    
}

extension AssetProvider {
    
    func Where(predicate : NSPredicate) -> Self{
        self._where = predicate
        self._collections = nil
        return self
    }
    
    func GroupBy(groupBy : ((asset: AssetProviderAsset)->String)) -> Self{
        self._groupBy = groupBy
        self._collections = nil
        return self
    }
}



extension AssetProvider{
    
    subscript(indexPath: NSIndexPath) -> AssetProviderAsset? {
        return self.collections[indexPath.section][indexPath.row]
    }
    
    
    func numberOfSections()->Int {
        return self.collections.count
    }
    
    func numberOfItemInSection(section : Int)->Int {
        return self.collections[section].count
    }
    
    
}