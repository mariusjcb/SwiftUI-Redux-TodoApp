//
//  TodoReducerExtensions.swift
//  First Redux&Combine App
//
//  Created by Marius Ilie on 08/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import Foundation

extension Array where Element == TodoReducer.ItemType {
    func item(at offset: IndexSet) -> Element? {
        guard let offset = offset.first else {
            return nil
        }
        
        return self
            .enumerated()
            .first(where: { $0.offset == offset })?.element
    }
    
    func replacingItem(at offset: IndexSet, with newElement: Element) -> Self {
        guard let offset = offset.first else {
            return self
        }
        
        return replacingItem(at: Int(offset), with: newElement)
    }
    
    func replacingItem(at offset: Int?, with newElement: Element) -> Self {
        guard let offset = offset else {
            return self
        }
        
        var newState = self
        newState[offset] = newElement
        
        return newState
    }
}
