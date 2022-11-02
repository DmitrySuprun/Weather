// WeatherCollectionViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Weather info
final class WeatherCollectionViewController: UICollectionViewController {
    // MARK: - Constants

    private enum Constants {
        static let reuseIdentifier = "weatherCollectionViewCellID"
    }

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.reuseIdentifier,
            for: indexPath
        ) as? WeatherCollectionViewCell
        else { return UICollectionViewCell() }
        cell.weatherTempLabel.text = "10C"
        cell.dateLabel.text = "03.11.22"
        return cell
    }
}
