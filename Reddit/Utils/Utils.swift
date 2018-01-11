//
//  Utils.swift
//  Reddit
//
//  Created by Vikram on 1/10/18.
//  Copyright © 2018 prokarma. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    /// This function is used to get brand font
    ///
    /// - Parameters:
    ///   - fontName: specify the font name
    ///   - fontSize: specify the font size
    ///   - maximumFontSize: specify the maximum font it can be scaled
    ///   - fontStyle: specify the font style by default if not specified it takes body
    /// - Returns: it return font after setting the font matrix
    static func brandFont(fontName: String,
                          fontSize: CGFloat,
                          maximumFontSize: CGFloat? = nil,
                          fontStyle: UIFontTextStyle = .body) -> UIFont? {
        
        var font = UIFont(name: fontName, size: fontSize) ??
            UIFont(name: defaultFontName, size: defaultFontSize)
        
        guard let preferedFont = font else {
            return nil
        }
        
        let fontMetrics = UIFontMetrics(forTextStyle: fontStyle)
        font = fontMetrics.scaledFont(for: preferedFont)
        if let size = maximumFontSize {
            font = fontMetrics.scaledFont(for: preferedFont, maximumPointSize: size)
        }
        return font
    }
}
