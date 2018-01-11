//
//  RedditTests.swift
//  RedditTests
//
//  Created by Vikram on 1/10/18.
//  Copyright © 2018 prokarma. All rights reserved.
//

import XCTest
@testable import Reddit

class RedditTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCardModel() {
        let card = Card(titleText: "Title", commentNumber: "12345", score: "88", imageURL: "http://www.apple.com/images/abc")
        
        XCTAssertNotNil(card.titleText , "title can't be nil")
        XCTAssertNotNil(card.commentNumber , "title can't be nil")
        XCTAssertNotNil(card.score , "title can't be nil")
        XCTAssertNotNil(card.imageURL , "title can't be nil")
        
        XCTAssert(card.titleText == "Title", "title is wrongly mapped")
        XCTAssert(card.commentNumber == "12345", "comment number is wrongly mapped")
        XCTAssert(card.score == "88", "score is wrongly mapped")
        XCTAssert(card.imageURL == "http://www.apple.com/images/abc")
    }
    
    func testCardsModel() {
        let card1 = Card(titleText: "Title", commentNumber: "12345", score: "88", imageURL: "http://www.apple.com/images/abcd")
        let card2 = Card(titleText: "Title1", commentNumber: "12345", score: "88", imageURL: "http://www.apple.com/images/abce")
        let card3 = Card(titleText: "Title2", commentNumber: "12345", score: "88", imageURL: "http://www.apple.com/images/abcf")
        let card4 = Card(titleText: "Title3", commentNumber: "12345", score: "88", imageURL: "http://www.apple.com/images/abcg")
        let card5 = Card(titleText: "Title4", commentNumber: "12345", score: "88", imageURL: "http://www.apple.com/images/abcgh")
        
        let cards = [card1,card2,card3,card4,card5]
        let cardsModel = Cards(urlLink: "http://www.apple.com/nextList", cards: cards)
        XCTAssert(cardsModel.urlLink == "http://www.apple.com/nextList", "Link is wrongly mapped")
        XCTAssert(cardsModel.cards?.count == 5, "No of cards not matching")
    }
    
}
