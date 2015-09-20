//
//  Array+GroupBy.swift
//  PictZ
//
//  Created by enomoto on 2015/09/20.
//  Copyright © 2015年 sarukun99. All rights reserved.
//

import Foundation


extension Array {
    
    func groupBy(evalKey : ((elem:Element)->String)?) -> [[Element]] {
        
        if let evalKey = evalKey {
            var groups = [String:[Element]]()
        
            self.forEach { (elem) -> () in
                let key = evalKey(elem: elem)
                if let _ = groups[key] {
                    groups[key]!.append(elem)
                }
                groups[key] = [Element]()
                groups[key]!.append(elem)
            }
        
        
            return groups.flatMap{
                return $1
            }
        }
        return [self]
    }
}