// WeekDayPicker.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Choice Day of Weak
@IBDesignable class WeekDayPicker: UIControl {
    // MARK: - Enum

    enum Day: String, CaseIterable {
        case monday = "MO"
        case tuesday = "TU"
        case wednesday = "WE"
        case thursday = "TH"
        case friday = "FR"
        case saturday = "SA"
        case sunday = "SU"
    }

    // MARK: - Public Properties

    var selectedDay: Day?

    // MARK: - Private Properties

    private var buttons: [UIButton] = []

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        for day in Day.allCases {
            let button = UIButton(type: .system)
            button.setTitle(day.rawValue, for: .normal)
            button.setTitleColor(.label, for: .normal)
            button.setTitleColor(.systemBackground, for: .selected)
            button.addTarget(self, action: #selector(selectDay(_:)), for: .touchUpInside)
            buttons.append(button)
        }

        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.frame = bounds
        addSubview(stackView)
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }

    @objc private func selectDay(_ sender: UIButton) {
        guard let rawValue = sender.titleLabel?.text else { return }
        selectedDay = Day(rawValue: rawValue) ?? Day.monday
        buttons.forEach { button in
            let isSelected = button === sender
            button.isSelected = isSelected
        }
        sendActions(for: .valueChanged)
    }
}
