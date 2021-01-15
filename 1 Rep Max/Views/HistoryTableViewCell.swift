//
//  HistoryCell.swift
//  1 Rep Max
//
//  Created by Mohammed Hossain on 12/15/20.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var innerView: UIView!
    
    // Labels for reusable cells
    @IBOutlet weak var historicMaxLabel: UILabel!
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var exerciseImage: UIImageView!
    
    // Function to apply card shape and shadow effect to table view cells
    func cardView(cell: UITableViewCell) {

        // Provide value for roundness effect of cell and shadow
        let cornerRadiusValue: CGFloat = 10
        
        // Cell roundness and shadow
        innerView.layer.cornerRadius = cornerRadiusValue
        innerView.layer.masksToBounds = false // Makes shadow visible when set to false
    
        // Cell shadow properties
        innerView.layer.shadowColor = UIColor.gray.cgColor // Sets color of shadow
        innerView.layer.shadowOffset = CGSize(width: 0, height: 0) // Sets distance of shadow from view to give 3D effect
        innerView.layer.shadowOpacity = 1 // Sets strength of shadow
        innerView.layer.shadowRadius = 3 // Sets width of shadow
        
        // Cell border properties
        innerView.layer.borderWidth = 2 // Sets cell border thickness
        innerView.layer.borderColor = UIColor(named: "Custom Color 4")?.cgColor // Sets cell border color to xcasset color
        
        // Sets shadowPath to specific value to improve performance when scrolling
        let shadowPath = UIBezierPath(roundedRect: innerView.bounds, cornerRadius: cornerRadiusValue)
        innerView.layer.shadowPath = shadowPath.cgPath
        innerView.layer.shouldRasterize = true
        innerView.layer.rasterizationScale = UIScreen.main.scale
    }

}
