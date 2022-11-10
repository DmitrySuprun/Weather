// AllCitiesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Show all available cities
final class AllCitiesViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let cellID = "cityCellID"
        static let addCitySegueID = "addCitySegueID"
        static let cityTableViewCellXib = "CityTableViewCellXib"
    }

    // MARK: - IBOutlets

    @IBOutlet var allCitiesTableView: UITableView!

    // MARK: - Public Properties

    var cities = ["Moscow", "Krasnoyarsk", "London", "Paris", "Warsaw", "Grodno"]

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    // MARK: - Private Properties

    private func setupTableView() {
        allCitiesTableView.register(
            UINib(nibName: Constants.cityTableViewCellXib, bundle: nil),
            forCellReuseIdentifier: Constants.cellID
        )
    }
}

// MARK: - UITableViewDataSource

extension AllCitiesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellID,
            for: indexPath
        ) as? CityTableViewCell
        else { return UITableViewCell() }
        cell.cityNameLabel.text = cities[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate

extension AllCitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.addCitySegueID, sender: nil)
    }
}
