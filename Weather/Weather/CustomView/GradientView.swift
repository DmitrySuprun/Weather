// GradientView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Gradient
final class GradientView: UIView {
    // MARK: - Public Properties

    override static var layerClass: AnyClass {
        CAGradientLayer.self
    }

    var gradientLayer: CAGradientLayer? {
        layer as? CAGradientLayer
    }

    // MARK: - Private IBInspectable Properties

    @IBInspectable private var startColor: UIColor = .white {
        didSet {
            updateColors()
        }
    }

    @IBInspectable private var endColor: UIColor = .black {
        didSet {
            updateColors()
        }
    }

    @IBInspectable private var startLocation: CGFloat = 0 {
        didSet {
            updateLocations()
        }
    }

    @IBInspectable private var endLocation: CGFloat = 1 {
        didSet {
            updateLocations()
        }
    }

    @IBInspectable private var startPoint: CGPoint = .zero {
        didSet {
            updateStartPoint()
        }
    }

    @IBInspectable private var endPoint: CGPoint = .init(x: 0, y: 1) {
        didSet {
            updateEndPoint()
        }
    }

    // MARK: - Private Methods

    private func updateLocations() {
        gradientLayer?.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }

    private func updateColors() {
        gradientLayer?.colors = [startColor.cgColor, endColor.cgColor]
    }

    private func updateStartPoint() {
        gradientLayer?.startPoint = startPoint
    }

    private func updateEndPoint() {
        gradientLayer?.endPoint = endPoint
    }
}
