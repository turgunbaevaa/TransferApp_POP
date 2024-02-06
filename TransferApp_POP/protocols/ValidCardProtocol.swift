//
//  ValidCardProtocol.swift
//  TransferApp_POP
//
//  Created by Aruuke Turgunbaeva on 6/2/24.
//

import Foundation
import UIKit

protocol ValidCardProtocol {
    func validCardNumber(cardNumber: UITextField, cardNumberLabel: UILabel) -> Bool
}

extension ValidCardProtocol {
    func validCardNumber(cardNumber: UITextField, cardNumberLabel: UILabel) -> Bool {
        // Проверяем, что длина строки равна 16 символам и содержит только цифры
        if cardNumber.text?.count == 16 && (cardNumber.text?.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil) {
            // Номер карты валиден
            cardNumberLabel.text = "Enter your requisite below:"
            cardNumberLabel.textColor = .black
            return true
        } else {
            // Номер карты невалиден
            cardNumberLabel.text = "Invalid card number"
            cardNumberLabel.textColor = .red
            return false
        }
    }
}
