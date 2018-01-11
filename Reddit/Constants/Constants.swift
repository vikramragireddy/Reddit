//
//  Constants.swift
//  Reddit
//
//  Created by Vikram on 1/10/18.
//  Copyright © 2018 prokarma. All rights reserved.
//

import Foundation
import UIKit

// MARK:- EndPoint Url
struct RedditEndPoints {
    static let domain = "http://www.reddit.com"
    static let path = "/.json"
    
    static var apiEndPoint: String {
        return domain + path
    }
}

// MARK:- Response Keys
let titleKey = "title"
let commentNumberKey = "num_comments"
let scoreKey = "score"
let imageURLKey = "thumbnail"

// MARK:- Font
enum FontName : String {
    case antiqua = "Tele-Antiqua"
    case groteskFet = "Tele-GroteskFet"
    case groteskHal = "Tele-GroteskHal"
    case groteskNor = "Tele-GroteskNor"
    case groteskUlt = "Tele-GroteskUlt"
}

let defaultFontSize = CGFloat(15)
let defaultFontName = FontName.groteskUlt.rawValue
let defaultFont = Utils.brandFont(fontName: defaultFontName, fontSize: defaultFontSize)

// MARK:- Image Name
let placeHolderImage = "PlaceHolder"
