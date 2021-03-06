//
//  Cart.swift
//  halloween-challenge
//
//  Created by Maegan Wilson on 10/29/21.
//

import Foundation

class Cart: ObservableObject {
    @Published var items: [StoreItem] = []
    @Published var total: Double = 0.0
    
    func addItemToCart(_ item: StoreItem){
        // check if item UUID is in cart
        // if in cart, then increase quantity
        // else add item with quanity 1
        
        total += item.price
        print(total)
        let indexOfFoundItem = items.firstIndex{ $0.id == item.id }
        print(items)

        guard let indexOfFoundItem = indexOfFoundItem else {
            print("INside guard")
            var tempItem = item
            tempItem.quantity = 1
            self.items.append(tempItem)
            print(items)
            return
        }
        print("Outside guard")
        self.items[indexOfFoundItem].quantity = items[indexOfFoundItem].quantity + 1
    }
    func purchaseCart() -> Bool{
        total = 0.0
        return true
    }
    
    func emptyItems(){
        items = []
    }
    
    func removeItem(_ item: StoreItem){
        total -= item.price
        
        let indexOfFoundItem = items.firstIndex{ $0.id == item.id }
        
        guard let indexOfFoundItem = indexOfFoundItem else {
            return
        }
        
        items[indexOfFoundItem].quantity = items[indexOfFoundItem].quantity - 1
        
        if items[indexOfFoundItem].quantity == 0 {
            items.remove(at: indexOfFoundItem)
        }
    }
}

extension Collection {
    func distance(to index: Index) -> Int { distance(from: startIndex, to: index) }
}
