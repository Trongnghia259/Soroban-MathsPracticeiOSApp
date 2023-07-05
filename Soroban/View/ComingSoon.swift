//
//  ComingSoon.swift
//  Soroban
//
//  Created by Tam Nguyen on 20/06/2023.
//

import Foundation
import UIKit
import SnapKit
import GoogleMobileAds

class Comingsoon: UIViewController {
    
    private let banner: GADBannerView = {
        let banner = GADBannerView()
        banner.adUnitID = "ca-app-pub-4835926675743094/4261140919"
        banner.load(GADRequest())
        banner.backgroundColor = .secondarySystemBackground
        return banner
    }()
    private let testbanner: GADBannerView = {
        let testBanner = GADBannerView()
        testBanner.adUnitID = "ca-app-pub-4835926675743094/1754768203"
        testBanner.backgroundColor = .systemMint
        return testBanner
    }()
    
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
        
        banner.rootViewController = self
        testbanner.rootViewController = self
        view.addSubview(banner)
        view.addSubview(testbanner)
        
        banner.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(label.snp.top).offset(-50)
            $0.width.equalTo(300)
            $0.height.equalTo(100)
        })
        testbanner.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.top.equalTo(label.snp.bottom).offset(50)
            $0.size.equalTo(300)
        })
    }
}
