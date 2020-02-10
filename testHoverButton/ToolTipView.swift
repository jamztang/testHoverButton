//
//  ToolTipView.swift
//  testHoverButton
//
//  Created by James Tang on 6/2/2020.
//  Copyright © 2020 James Tang. All rights reserved.
//

import UIKit

public protocol ToolTipView: class {
    var tooltip: String? { get }
}

public extension ToolTipView where Self: UIView {
    @available(iOS 13.0, *)
    func addInteraction(_ interaction: ToolTipInteraction) {
        interaction.setupView(self)
    }
}
