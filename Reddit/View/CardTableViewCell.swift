//
//  CardTableViewCell.swift
//  Reddit
//
//  Created by Vikram on 1/10/18.
//  Copyright © 2018 prokarma. All rights reserved.
//

import UIKit
import SDWebImage

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var commentNumber: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        resetCardCell()
    }
    
    private func resetCardCell() {
        title.text = ""
        commentNumber.text = ""
        score.text = ""
        cardImage.sd_cancelCurrentImageLoad()
        cardImage.image = nil
        activityIndicator.isHidden = true
    }
    
    func configureCardTableViewCell(card: Card) {
        title.text = "Title: " + (card.titleText ?? "")
        title.font = defaultFont
        commentNumber.text = "Number: " + (card.commentNumber ?? "")
        commentNumber.font = defaultFont
        score.text = "Score: " + (card.score ?? "")
        score.font = defaultFont
        
        if let imageUrl = card.imageURL {
            if let imageUrl = URL(string: imageUrl) {
                activityIndicator.isHidden = false
                activityIndicator.startAnimating()
                cardImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: placeHolderImage), options: .lowPriority, completed: { [weak self] (image, error, cachetype, url) in
                    guard let strongSelf = self else{
                        return
                    }
                    strongSelf.activityIndicator.stopAnimating()
                    strongSelf.activityIndicator.isHidden = true
                })
            }
        }
        cardImage.accessibilityTraits = UIAccessibilityTraitImage
        cardImage.accessibilityHint = "Card Image"
    }
}
