//
//  Data.swift
//  Reddit
//
//  Created by Vikram on 1/10/18.
//  Copyright © 2018 prokarma. All rights reserved.
//

import UIKit

/// This model contains all the information about the elements that are shown on the UI for a card like title, comment number, score
struct Card {
    var titleText: String?
    var commentNumber: String?
    var score: String?
    var imageURL: String?
    
    init(titleText: String?,
         commentNumber: String?,
         score: String?,
         imageURL: String?) {
        
        self.titleText = titleText
        self.commentNumber = commentNumber
        self.score = score
        self.imageURL = imageURL
    }
}
