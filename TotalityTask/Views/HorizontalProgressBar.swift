//
//  HorizontalProgressBar.swift
//  TotalityTask
//
//  Created by Karthikeyan K on 21/06/21.
//

import UIKit

@IBDesignable
class HorizontalProgressBar: UIView {
    @IBInspectable var color: UIColor? = .init(red: 0, green: 1, blue: 0, alpha: 0.8) {
        didSet { setNeedsDisplay() }
    }
    
    var progress: CGFloat = 0 {
        didSet { setNeedsDisplay() }
    }
    
    private let progressLayer = CALayer()
    private let backgroundMask = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
    }

    private func setupLayers() {
        layer.addSublayer(progressLayer)
    }

    override func draw(_ rect: CGRect) {
        backgroundMask.path = UIBezierPath(roundedRect: rect, cornerRadius: 25).cgPath
        layer.mask = backgroundMask

        let progressRect = CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: rect.height))

        progressLayer.frame = progressRect
        progressLayer.cornerRadius = 25
        progressLayer.backgroundColor = color?.cgColor
    }
}
