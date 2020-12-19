//
//  HistoryCell.swift
//  1 Rep Max
//
//  Created by Mohammed Hossain on 12/15/20.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    func cardView(cell: UITableViewCell) {
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.masksToBounds = true

        
        cell.contentView.layer.borderWidth = 0.5
        
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cell.layer.shadowRadius = 12
        cell.layer.shadowOpacity = 0.7
        cell.layer.masksToBounds = false
  
    }

    
    
    
}
