// CityTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Cities information
final class CityTableViewCell: UITableViewCell {
    // MARK: - IBOutlets

    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityEmblemImageView: UIImageView!

    // MARK: - LifeCycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
