//
//  SuccessPageVC.swift
//  TransferApp_POP
//
//  Created by Aruuke Turgunbaeva on 6/2/24.
//

import UIKit
import SnapKit

class SuccessPageVC: UIViewController {

    private let successLabel: UILabel = {
        let label = UILabel()
        label.text = "Success!"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(successLabel)
        successLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }
    }
}
