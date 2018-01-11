//
//  TMOServiceDataModel.swift
//  Reddit
//
//  Created by Vikram on 1/10/18.
//  Copyright © 2018 prokarma. All rights reserved.
//

import Foundation

/// This Model Contains information of both request and response
class ServiceDataModel: NSObject {
    private(set) var request: ServiceRequest
    var response: ServiceResponse

    init(request: ServiceRequest, response: ServiceResponse? = nil) {
        self.request = request
        if let response = response {
            self.response = response
        } else {
            self.response = ServiceResponse()
        }
    }
}
