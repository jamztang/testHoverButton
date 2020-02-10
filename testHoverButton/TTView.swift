//
//  File.swift
//  testHoverButton
//
//  Created by James Tang on 10/2/2020.
//  Copyright © 2020 James Tang. All rights reserved.
//

import UIKit

class TTView: UIView, ToolTipView {
    private let toolTipInteraction = ToolTipInteraction()
    @IBInspectable var tooltip: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        addInteraction(toolTipInteraction)
    }
}

class TTButton: UIButton, ToolTipView {
    private let toolTipInteraction = ToolTipInteraction()
    @IBInspectable var tooltip: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        addInteraction(toolTipInteraction)
    }
}
