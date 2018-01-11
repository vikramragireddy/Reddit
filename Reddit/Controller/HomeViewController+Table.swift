//
//  HomeViewController+Table.swift
//  Reddit
//
//  Created by Vikram on 1/10/18.
//  Copyright © 2018 prokarma. All rights reserved.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as? CardTableViewCell else {
            assertionFailure("Unable to dequeue cell")
            return UITableViewCell()
        }
        
        let card = cards[indexPath.row]
        cell.configureCardTableViewCell(card: card)
        return cell
    }

    // This method is used to get next set of data after reaching to the bottom of the table view
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (cards.count - 1) {
            self.getCardsData()
        }
    }
}
