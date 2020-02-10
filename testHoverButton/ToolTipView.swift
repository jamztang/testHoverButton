//
//  ToolTipView.swift
//  testHoverButton
//
//  Created by James Tang on 6/2/2020.
//  Copyright © 2020 James Tang. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ToolTipView: UIView {
    @IBInspectable var tooltip: String? {
        didSet {
            tooltipInteraction.tooltip = self.tooltip
        }
    }
    private let tooltipInteraction = ToolTipInteraction()

    override func awakeFromNib() {
        super.awakeFromNib()
        addInteraction(tooltipInteraction)
    }
}

@available(iOS 13.0, *)
class ToolTipButton: UIButton {
    @IBInspectable var tooltip: String? {
        didSet {
            tooltipInteraction.tooltip = self.tooltip
        }
    }
    private let tooltipInteraction = ToolTipInteraction()

    override func awakeFromNib() {
        super.awakeFromNib()
        addInteraction(tooltipInteraction)
    }
}

