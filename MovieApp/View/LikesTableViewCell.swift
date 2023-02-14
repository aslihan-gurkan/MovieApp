//
//  LikesTableViewCell.swift
//  MovieApp
//
//  Created by Aslıhan Gürkan on 12.02.2023.
//

import UIKit

class LikesTableViewCell: UITableViewCell {

    @IBOutlet weak var likedImageView: UIImageView!
    @IBOutlet weak var likedMovieName: UILabel!
    @IBOutlet weak var likedMovieReleaseDate: UILabel!

    @IBOutlet weak var movieIdLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
