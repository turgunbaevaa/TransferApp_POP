//
//  TransferProtocol.swift
//  TransferApp_POP
//
//  Created by Aruuke Turgunbaeva on 6/2/24.
//

import Foundation
import UIKit

protocol TransferProtocol {
    func validate(amount: Float, tf: UITextField, label: UILabel, balanceLabel: UILabel)
}

extension TransferProtocol {
    func validate(amount: Float, tf: UITextField, label: UILabel, balanceLabel: UILabel) {
        guard let balanceText = balanceLabel.text?.replacingOccurrences(of: "$", with: ""),
              let balance = Float(balanceText) else {
            return
        }

        if amount >= 20 && amount <= balance {
            label.text = "Enter your amount below:"
            label.textColor = .black
        } else {
            label.text = "Amount should be greater than or equal to $20 and less than or equal to your balance"
            label.textColor = .red
        }
    }
}

