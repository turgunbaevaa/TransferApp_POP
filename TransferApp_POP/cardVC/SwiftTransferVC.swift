//
//  SwiftTransferVC.swift
//  TransferApp_POP
//
//  Created by Aruuke Turgunbaeva on 6/2/24.
//

import Foundation
import UIKit

class SwiftTransferVC: UIViewController, TransferProtocol, ValidCardProtocol {
    
    private let requisiteLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your requisite below:"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let requisiteTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter your requisite"
        return tf
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your amount below:"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let amountTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter your amount"
        return tf
    }()
    
    private let validateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Transfer", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 16
        return button
    }()
    
    private let senderCardNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Sender Card: 4379-8765-7643-1234"
        label.textColor = .blue
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let senderBalanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Balance:"
        label.textColor = .blue
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var itemBalance = 1000

    private lazy var itemBalanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.text = "$\(itemBalance)"
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = .white
        setupSenderCardNumberLabel()
        setupSenderBalanceLabel()
        setupSenderBalance()
        
        setupRequsiteLabel()
        setupRequisiteTF()
        setupAmountLabel()
        setupAmountTF()
        setupValidateButton()
    }
    
    private func setupSenderCardNumberLabel(){
        view.addSubview(senderCardNumberLabel)
        senderCardNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    private func setupSenderBalanceLabel(){
        view.addSubview(senderBalanceLabel)
        senderBalanceLabel.snp.makeConstraints { make in
            make.top.equalTo(senderCardNumberLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    private func setupSenderBalance(){
        view.addSubview(itemBalanceLabel)
        itemBalanceLabel.snp.makeConstraints { make in
            make.top.equalTo(senderCardNumberLabel.snp.bottom).offset(10)
            make.leading.equalTo(senderBalanceLabel.snp.trailing).offset(3)
            make.centerY.equalTo(senderBalanceLabel.snp.centerY)
        }
    }
    
    private func setupRequsiteLabel(){
        view.addSubview(requisiteLabel)
        requisiteLabel.snp.makeConstraints { make in
            make.top.equalTo(senderBalanceLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    private func setupRequisiteTF(){
        view.addSubview(requisiteTF)
        requisiteTF.snp.makeConstraints { make in
            make.top.equalTo(requisiteLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
    }
    
    private func setupAmountLabel(){
        view.addSubview(amountLabel)
        amountLabel.snp.makeConstraints { make in
            make.top.equalTo(requisiteTF.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func setupAmountTF(){
        view.addSubview(amountTF)
        amountTF.snp.makeConstraints { make in
            make.top.equalTo(amountLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
    }
    
    private func setupValidateButton(){
        view.addSubview(validateButton)
        validateButton.snp.makeConstraints { make in
            make.top.equalTo(amountTF.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
        validateButton.addTarget(self, action: #selector(validateAmount), for: .touchUpInside)
    }
    
    @objc func validateAmount(_ sender: UIButton) {
        guard let amountText = amountTF.text, let amount = Float(amountText) else { return }
       validate(amount: amount, tf: amountTF, label: amountLabel, balanceLabel: itemBalanceLabel)
        
        let isCardNumberValid = validCardNumber(cardNumber: requisiteTF, cardNumberLabel: requisiteLabel)

        if isCardNumberValid {
            if amount >= 20 && amount <= Float(itemBalance) {
                let vc = SuccessPageVC()
                navigationController?.pushViewController(vc, animated: true)
                amountLabel.text = "Enter your amount below:"
                amountLabel.textColor = .black
            } else {
                amountLabel.text = "Amount should be greater than or equal to $20 and less than or equal to your balance"
                amountLabel.textColor = .red
            }
        } else {
            validateButton.backgroundColor = .gray
        }
    }
}

