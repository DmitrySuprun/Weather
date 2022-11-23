// WeatherCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Weather info cell
final class WeatherCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlets

    @IBOutlet private var containerView: UIView! {
        didSet {
            layer.shadowColor = UIColor.red.cgColor
            layer.shadowRadius = 10
            layer.shadowOpacity = 1
            layer.shadowOffset = CGSize(width: 5, height: 5)
        }
    }
   
    @IBOutlet var weatherTempLabel: UILabel! {
        didSet {
            weatherTempLabel.layer.cornerRadius = 30
            weatherTempLabel.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var weatherIconImageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
}
