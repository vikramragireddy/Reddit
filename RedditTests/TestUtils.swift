//
//  TestUtils.swift
//  RedditTests
//
//  Created by vragireddy on 1/10/18.
//  Copyright © 2018 prokarma. All rights reserved.
//

import UIKit

class TestUtils: NSObject {
    
    /**
     Grab data from json file and convert it into dictionary
     */
    static func loadJSON(_ fileName: String) -> Data? {
        let errorMsg = "Bad or failed JSON parsing for \(fileName).json"
        let bundle = Bundle.main
        
        guard let fileURL = bundle.url(forResource: fileName, withExtension: "json"), let data = NSData(contentsOf: fileURL) as Data? else {
            print(errorMsg)
            return nil
        }
        return data
    }
}
