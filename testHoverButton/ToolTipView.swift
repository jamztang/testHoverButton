//
//  ToolTipView.swift
//  testHoverButton
//
//  Created by James Tang on 6/2/2020.
//  Copyright © 2020 James Tang. All rights reserved.
//

import UIKit

class ToolTipView: UIView {
    private let toolTipGestureRecognizer = ToolTipGestureRecognizer()
    private let label = UITextView(frame: .zero)
    @IBInspectable var tooltip: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        label.alpha = 0
        toolTipGestureRecognizer.addTarget(self, action: #selector(handleToolTipGesture(_:)))
        addGestureRecognizer(toolTipGestureRecognizer)
    }

    @objc func handleToolTipGesture(_ recognizer: UIHoverGestureRecognizer) {
        let point = recognizer.location(in: self)
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
            self.addSubview(label)
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
