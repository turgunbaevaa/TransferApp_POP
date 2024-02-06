//
//  CardListsVC.swift
//  TransferApp_POP
//
//  Created by Aruuke Turgunbaeva on 6/2/24.
//

import UIKit
import SnapKit

class CardListsVC: UIViewController {
    
    private let visaToVisaTransferButton: UIButton = {
        let button = UIButton()
        button.setTitle("Visa To Visa Transfer", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 16
        return button
    }()
    
    private let elcartTransferButton: UIButton = {
        let button = UIButton()
        button.setTitle("Elcart to Elcart Transfer", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 16
        return button
    }()
    
    private let swiftTransferButton: UIButton = {
        let button = UIButton()
        button.setTitle("Swift to Swift Transfer", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 16
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = .white
        setupVisaTransferButton()
        setupElcartTransferButton()
        setupSwiftTransferButton()
    }
    
    private func setupVisaTransferButton(){
        view.addSubview(visaToVisaTransferButton)
        visaToVisaTransferButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
        visaToVisaTransferButton.addTarget(self, action: #selector(visaTransfer), for: .touchUpInside)
    }
    
    private func setupElcartTransferButton(){
        view.addSubview(elcartTransferButton)
        elcartTransferButton.snp.makeConstraints { make in
            make.top.equalTo(visaToVisaTransferButton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
        elcartTransferButton.addTarget(self, action: #selector(elcartTransfer), for: .touchUpInside)
    }
    
    private func setupSwiftTransferButton(){
        view.addSubview(swiftTransferButton)
        swiftTransferButton.snp.makeConstraints { make in
            make.top.equalTo(elcartTransferButton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
        swiftTransferButton.addTarget(self, action: #selector(swiftTransfer), for: .touchUpInside)
    }
    
    @objc private func visaTransfer(_ sender: UIButton){
        let vc = VisaToVisaTransferVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func elcartTransfer(_ sender: UIButton){
        let vc = ElcartTransferVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func swiftTransfer(_ sender: UIButton){
        let vc = SwiftTransferVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
