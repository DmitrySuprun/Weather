// WeatherViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Weather info
final class WeatherViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let reuseIdentifier = "weatherCollectionViewCellID"
    }

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UICollectionViewDataSource

extension WeatherViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(
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
