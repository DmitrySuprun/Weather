// AllCitiesTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Show all available cities
final class AllCitiesTableViewController: UITableViewController {
    // MARK: - Constants

    private enum Constants {
        static let identifier = "cityCellID"
    }

    // MARK: - Public Properties

    var cities = ["Moscow", "Krasnoyarsk", "London", "Paris", "Warsaw", "Grodno"]

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - TableView data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.identifier,
            for: indexPath
        ) as? AllCitiesTableViewCell
        else { return UITableViewCell() }
        cell.cityNameLabel.text = cities[indexPath.row]
        return cell
    }
}
