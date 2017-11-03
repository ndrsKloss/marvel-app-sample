//
//  CharacterTableViewCell.swift
//  marvel-sample-app
//
//  Created by Anderson  Kloss Maia on 03/11/17.
//  Copyright © 2017 Anderson Kloss Maia. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {
    static let identifier = "CharacterTableViewCellIdentifier"
    
    @IBOutlet weak var imageThumbnail: UIImageView! {
        didSet {
            imageThumbnail.clipsToBounds = true
            imageThumbnail.layer.cornerRadius = 7.5
            imageThumbnail.contentMode = .scaleToFill
        }
    }
    
    @IBOutlet weak var labelDescription: UILabel! {
        didSet {
            labelDescription.text = ""
            labelDescription.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
            labelDescription.textColor = UIColor.marvelGreyTextColor
        }
    }

    @IBOutlet weak var labelTitle: UILabel! {
        didSet {
            labelTitle.text = ""
            labelTitle.font = UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.bold)
            labelTitle.textColor = UIColor.black
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func configure(character: Character) {

        if let imageUrl = character.imageUrl, let url = URL(string: imageUrl) {
            self.imageThumbnail.kf.indicatorType = .activity
            let resource = ImageResource(downloadURL: url, cacheKey: imageUrl)
            self.imageThumbnail.kf.setImage(with: resource)
        }

        self.labelTitle.text = character.name
        self.labelDescription.text = character.description
    }
}
