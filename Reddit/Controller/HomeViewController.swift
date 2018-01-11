//
//  ViewController.swift
//  Reddit
//
//  Created by Vikram on 1/10/18.
//  Copyright © 2018 prokarma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    private(set) var cards = [Card]()
    // link stores the information about the next url that needs to be fired after scrolling to the end of the table. Initally default url
    private(set) var link: String?
    
    // MARK:- Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        configureTableView()
        if cards.count == 0 {
            link = RedditEndPoints.apiEndPoint
            getCardsData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        cards.removeAll()
    }
    
    // MARK:- Custom Methods
    
    // This method is used to configure table view
    private func configureTableView() {
        homeTableView.rowHeight = UITableViewAutomaticDimension
        homeTableView.estimatedRowHeight = 200
    }
    
    
    /// This method is used to get cards that are required for the tableview to show on UI
    func getCardsData() {
        
        if let network = Reachability()?.connection, network == .none {
            return
        }
        if let url = link {
            DataManager.getCards(url: url) { [weak self] (data) in
                guard let strongSelf = self else {
                    return
                }
                if let data = data, let newCards = data.cards {
                    strongSelf.cards += newCards
                    strongSelf.link = data.urlLink
                    
                    DispatchQueue.main.async { [weak self] in
                        guard let strongSelf = self else {
                            return
                        }
                        strongSelf.homeTableView.reloadData()}
                }
            }
        }
    }
    

}

