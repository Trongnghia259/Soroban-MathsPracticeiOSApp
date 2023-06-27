//
//  ComingSoon.swift
//  Soroban
//
//  Created by Tam Nguyen on 20/06/2023.
//

import Foundation
import UIKit
import SnapKit

class Comingsoon: UIViewController {

    let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .systemGray5
        view.addSubview(label)
        label.text = "Coming soon"
        label.font = .systemFont(ofSize: 25, weight: .medium)
        label.snp.makeConstraints({
            $0.center.equalToSuperview()
        })
    }
}
