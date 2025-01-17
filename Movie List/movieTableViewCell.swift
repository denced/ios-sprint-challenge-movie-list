//
//  movieTableViewCell.swift
//  Movie List
//
//  Created by denis cedeno on 9/28/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

//protocol QATableViewCellDelegate: AnyObject {
//    func emojiButtonWasTapped(cell: QATableViewCell)
//}
protocol MovieTableViewCellDelegate: AnyObject{
    func seenButtonWasTapped(cell: movieTableViewCell)
}

class movieTableViewCell: UITableViewCell {

    weak var delegate: MovieTableViewCellDelegate?
    
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var seenButton: UIButton!
    @IBAction func seenButtonTapped(_ sender: Any) {
        movie?.movieSeen.toggle()
    }
    
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }

    
    private func updateViews() {
        guard let movie = movie else {return}
        
        movieLabel.text = movie.movieName
        seenButton.setTitle(movie.movieSeen ? "Seen" : "Not Seen", for: .normal)
        //seenButton.setTitle("not seen", for: [])
        
    }
    
}
