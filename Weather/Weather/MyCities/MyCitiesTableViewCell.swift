// MyCitiesTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Cities information
final class MyCitiesTableViewCell: UITableViewCell {
    // MARK: - IBOutlets

    @IBOutlet var myCitiesLabel: UILabel!

    // MARK: - LifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
