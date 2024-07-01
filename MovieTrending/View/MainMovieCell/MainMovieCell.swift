//
//  MainMovieCell.swift
//  MovieTrending
//
//  Created by Bruno Mazzocchi on 30/6/24.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {
    
    // This identifier should be added to the UI
    public static var identifier: String {
        get {
            return "MainMovieCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "MainMovieCell", bundle: nil)
    }
    
    @IBOutlet weak var moveImageView: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.addBorder(color: .label, width: 1)
        backView.round()
        
        moveImageView.round(5)
    }
    
    func setUpCell(viewModel: MovieTableCellViewModel) {
        self.nameLabel.text = viewModel.title
        self.rateLabel.text = viewModel.rating
        self.moveImageView.sd_setImage(with: viewModel.imageUrl )
    }
}
