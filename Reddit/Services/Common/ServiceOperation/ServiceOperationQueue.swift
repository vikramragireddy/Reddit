//
//  TMServiceOperationQueue.swift
//  Reddit
//
//  Created by Vikram on 1/10/18.
//  Copyright © 2018 prokarma. All rights reserved.
//

import Foundation
final class ServiceOperationQueue: OperationQueue {

    static let sharedOperation = ServiceOperationQueue()
    private struct Constants {
        static let kMaxConcurrentOperationCount = 10
        static let kQueueName = "GlobalOperationQueue"
    }

    private override init() {
        super.init()
        maxConcurrentOperationCount = Constants.kMaxConcurrentOperationCount
        name = Constants.kQueueName
    }
}
