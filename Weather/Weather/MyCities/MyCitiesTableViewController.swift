// MyCitiesTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Favourites cities list
class MyCitiesTableViewController: UITableViewController {
    // MARK: - Constants

    private enum Constants {
        static let identifier = "myCitiesCellID"
        static let addCitySegueID = "addCitySegueID"
    }

    // MARK: - Public Properties

    var cities: [String] = []

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBAction

    @IBAction func addCity(segue: UIStoryboardSegue) {
        if segue.identifier == Constants.addCitySegueID {
            guard let allCitiesViewController = segue.source as? AllCitiesTableViewController
            else { return }
            if let indexPath = allCitiesViewController.tableView.indexPathForSelectedRow {
                let city = allCitiesViewController.cities[indexPath.row]
                if !cities.contains(city) {
                    cities.append(city)
                    tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

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
        ) as? MyCitiesTableViewCell
        else { return UITableViewCell() }
        cell.myCitiesLabel.text = cities[indexPath.row]
        return cell
    }

    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
