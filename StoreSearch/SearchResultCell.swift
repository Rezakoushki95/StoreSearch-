//
//  SearchResultCell.swift
//  StoreSearch
//
//  Created by Reza Koushki on 10/05/2022.
//

import UIKit

class SearchResultCell: UITableViewCell {

	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var artistNameLabel: UILabel!
	@IBOutlet weak var artworkImageView: UIImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		let selectedView = UIView(frame: .zero)
		selectedView.backgroundColor = UIColor(named: "SearchBar")?.withAlphaComponent(0.5)
		selectedBackgroundView = selectedView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
