//
//  DetailsTableViewCell.swift
//  MovieApp
//
//  Created by Aslıhan Gürkan on 11.02.2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()// Initialization code
        movieImage.layer.cornerRadius = movieImage.bounds.width / 8
        movieImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
