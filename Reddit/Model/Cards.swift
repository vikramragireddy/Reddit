//
//  TMCards.swift
//  Reddit
//
//  Created by Vikram on 1/10/18.
//  Copyright © 2018 prokarma. All rights reserved.
//

import UIKit

/// This model used to save all the card models and the next endpointurl
struct Cards {
    var urlLink: String?
    var cards: [Card]?
    
    init(urlLink: String?, cards: [Card]?) {
        self.urlLink = urlLink
        self.cards = cards
    }
}
