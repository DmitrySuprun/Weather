// WeatherCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Weather info cell
final class WeatherCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlets

    @IBOutlet var weatherTempLabel: UILabel!
    @IBOutlet var weatherIconImageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
}
