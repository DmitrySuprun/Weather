// MyCitiesTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Favourites cities list
class MyCitiesTableViewController: UITableViewController {
    // MARK: - Constants

    private enum Constants {
        static let cellID = "cityCellID"
        static let addCitySegueID = "addCitySegueID"
        static let cityTableViewCellXib = "CityTableViewCellXib"
        static let weatherViewControllerSegueID = "weatherViewControllerSegueID"
    }

    // MARK: - Public Properties

    var cities: [String] = []

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    // MARK: - IBAction

    @IBAction func addCity(segue: UIStoryboardSegue) {
        if segue.identifier == Constants.addCitySegueID {
            guard let allCitiesViewController = segue.source as? AllCitiesViewController
            else { return }
            if let indexPath = allCitiesViewController.allCitiesTableView.indexPathForSelectedRow {
                let city = allCitiesViewController.cities[indexPath.row]
                if !cities.contains(city) {
                    cities.append(city)
                    tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Private Properties

    private func setupTableView() {
        tableView.register(
            UINib(nibName: Constants.cityTableViewCellXib, bundle: nil),
            forCellReuseIdentifier: Constants.cellID
        )
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
            withIdentifier: Constants.cellID,
            for: indexPath
        ) as? CityTableViewCell
        else { return UITableViewCell() }
        cell.cityNameLabel.text = cities[indexPath.row]
        return cell
    }

    // MARK: - UITableViewDelegate

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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.weatherViewControllerSegueID, sender: nil)
    }
}
