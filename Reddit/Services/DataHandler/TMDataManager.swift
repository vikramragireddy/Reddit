//
//  TMDataManager.swift
//  Reddit
//
//  Created by Vikram on 1/10/18.
//  Copyright © 2018 prokarma. All rights reserved.
//

import UIKit
import SwiftyJSON

/// call back after retriving the response, retuns cards model
typealias ServiceResponseCompletion = (Cards?) -> Void

class DataManager: NSObject {
    
    
    /// This method is used to get cards from the reddit url,
    ///
    /// - Parameters:
    ///   - url: final url path
    ///   - completionBlock: retuns cards after succesful the service call
    class func getCards(url: String, completionBlock: @escaping ServiceResponseCompletion) {
        guard let request = getRequest(url: url) else {
            tLog("Unable to form request")
            return
        }
        let model = ServiceDataModel(request: request)
        let serviceOperation = ServiceOperation.serviceOperation(dataModel: model) {(serviceModel) in
            let cards = parseDataModel(dataModel: serviceModel)
            completionBlock(cards)
        }
        
        if let serviceOperation = serviceOperation {
            ServiceOperationQueue.sharedOperation.addOperation(serviceOperation)
        } else {
            tLog("Unable to create service operation")
        }
    }
    
    //This method is used to get url request for the endpoint url
    class func getRequest(url: String) -> ServiceRequest? {
        let request = ServiceRequest(apiEndPoint: url, httpMethod: .get, contentType: RequestContentType.JSON)
        return request
    }
    
    //This method is used to parse the response data model and retrive cards from it
    private class func parseDataModel(dataModel: ServiceDataModel) -> Cards? {
        let response = dataModel.response
        guard let data = response.responseData else {
            return nil
        }
        do {
            let json = try JSON(data: data)
            let nextLink = json["data"]["after"].string
            let childrenArray = json["data"]["children"]
            var children = [Card]()
            for index in 0...childrenArray.count - 1 {
                let title = json["data"]["children"][index]["data"]["title"].string
                let score = json["data"]["children"][index]["data"]["score"].stringValue
                let commentNumber = json["data"]["children"][index]["data"]["num_comments"].stringValue
                let imageUrl = json["data"]["children"][index]["data"]["thumbnail"].string

                let card = Card(titleText: title, commentNumber: commentNumber, score: score, imageURL: imageUrl)
                children.append(card)
            }
            
            var nextURL: String?
            if let nextLink = nextLink {
                nextURL = RedditEndPoints.apiEndPoint + "?after=\(nextLink)"
            }
        
            let cards = Cards(urlLink: nextURL, cards: children)
            return cards
        } catch {
            
        }
        return nil
    }
    
}
