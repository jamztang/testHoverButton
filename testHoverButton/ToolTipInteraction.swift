//
//  ToolTipInteraction.swift
//  testHoverButton
//
//  Created by James Tang on 10/2/2020.
//  Copyright © 2020 James Tang. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ToolTipInteraction: NSObject {
    private let toolTipGestureRecognizer = ToolTipGestureRecognizer()
    private let label = UITextView(frame: .zero)
    private var view: UIView!
    var tooltip: String?

    func setupView(_ view: UIView) {
        self.view = view
        label.alpha = 0
        toolTipGestureRecognizer.addTarget(self, action: #selector(handleToolTipGesture(_:)))
        view.addGestureRecognizer(toolTipGestureRecognizer)
    }

    @objc func handleToolTipGesture(_ recognizer: UIHoverGestureRecognizer) {
        let point = recognizer.location(in: view)
        if recognizer.state == .began, let tooltip = tooltip {
            let cursorOffset: CGFloat = 25
            label.text = tooltip
            label.backgroundColor = UIColor.secondarySystemBackground
            label.layer.borderColor = UIColor.opaqueSeparator.cgColor
            label.layer.borderWidth = 1
            label.layer.shadowRadius = 4
            label.layer.shadowColor = UIColor.black.cgColor
            label.layer.shadowOpacity = 0.2
            label.layer.shadowOffset = CGSize(width: 0, height: 1)
            label.clipsToBounds = false
            label.isEditable = false
            label.textContainerInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
            label.font = UIFont.preferredFont(forTextStyle: .footnote)
            label.sizeToFit()
            label.transform = .init(translationX: point.x, y: point.y + cursorOffset)
            view.addSubview(label)
            label.alpha = 0
            UIView.animate(withDuration: 0.1) {
                self.label.alpha = 1
            }
        } else if recognizer.state == .ended {
            if label.superview != nil {
                UIView.animate(withDuration: 0.7, delay: 0.3, options: [], animations: {
                    self.label.alpha = 0
                }) { _ in
                    self.label.removeFromSuperview()
                }
            }
        }
    }
}

extension UIView {
    @available(iOS 13.0, *)
    func addInteraction(_ interaction: ToolTipInteraction) {
        interaction.setupView(self)
    }
}
