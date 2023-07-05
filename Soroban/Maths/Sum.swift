//
//  Sum.swift
//  Soroban
//
//  Created by Tam Nguyen on 18/06/2023.
//

import Foundation
import SnapKit
import GoogleMobileAds

class Sum: UIViewController {
    
    private let banner: GADBannerView = {
        let banner = GADBannerView()
        banner.adUnitID = "ca-app-pub-4835926675743094/4261140919"
        banner.load(GADRequest())
        banner.backgroundColor = .secondarySystemBackground
        return banner
    }()
    
    var minA = 1
    var maxA = 10
    var minB = 1
    var maxB = 10
    var speeds = 2.5
    var calculator = 3
    
    private lazy var startNumber = Int.random(in: minA..<maxA)
    private var timemath = 10
    private var speed = 3.0
    var repeatsTime  = 0
    let numberLabel = UILabel()
    let startButton: UIButton = {
        let sButton = UIButton()
        sButton.translatesAutoresizingMaskIntoConstraints = false
        return sButton
    }()
    let finishButton: UIButton = {
        let sButton = UIButton()
        sButton.backgroundColor = .red
        sButton.translatesAutoresizingMaskIntoConstraints = false
        return sButton
    }()
    var imageView = UIImageView()
    let backgroundImage = UIImage(named: "math")
    override func viewDidLoad() {
        super.viewDidLoad()
        addBanner()
        settingUI()
        
    }
    @objc func start() {
        getValue()
        numberLabel.text = "\(startNumber)"
        startButton.isHidden = true
        openAnimate()
        Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { [weak self] time in
            self?.plus()
            self?.repeatsTime = (self?.repeatsTime ?? 0) + 1
            if self?.repeatsTime == self?.timemath {
                time.invalidate()
                self?.finishButton.isHidden = false
                self?.repeatsTime = 0
            }
            self?.openAnimate()
        }
    }
    func openAnimate() {
        UIView.animate(withDuration: speed/2, animations: { [self] in
            numberLabel.frame = CGRect(x: 0,
                                       y: 0,
                                       width: view.frame.size.width/2,
                                       height: view.frame.size.width
            )
            numberLabel.center = view.center
        })
    }
    func getValue() {
        minA = UserDefaults.standard.integer(forKey: "minA")
        maxA = UserDefaults.standard.integer(forKey: "maxA")
        minB = UserDefaults.standard.integer(forKey: "minB")
        maxB = UserDefaults.standard.integer(forKey: "maxB")
        speeds = UserDefaults.standard.double(forKey: "speed")
        calculator = UserDefaults.standard.integer(forKey: "calculator")
        if minA == 0 {
            minA = 1
            maxA = 10
            minB = 1
            maxB = 10
            speeds = 3.0
            calculator = 5
        }
        speed = speeds
        timemath = calculator
    }
    func plus() {
        let randomNumber = Int.random(in: minB..<maxB)
        startNumber = startNumber + randomNumber
        numberLabel.text = "+\(randomNumber)"
        numberLabel.reloadInputViews()
    }
    @objc func finnish() {
        numberLabel.text = "= \(startNumber)"
        reloadInputViews()
        openAnimate()
        startNumber = Int.random(in: minA..<maxA)
        finishButton.isHidden = true
        startButton.isHidden = false
    }
}

extension Sum {
    
    func addBanner() {
        banner.rootViewController = self
        view.addSubview(banner)
        banner.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(view.frame.size.height/12)
        })
    }
    func settingUI() {
//        navigationController?.isToolbarHidden = true
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.hidesBackButton = true
        imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = backgroundImage
        view.addSubview(imageView)
        view.addSubview(numberLabel)
        view.addSubview(startButton)
        view.addSubview(finishButton)
        view.addSubview(banner)

        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalTo(banner.snp.top)
        }
        numberLabel.snp.makeConstraints({
            $0.center.equalToSuperview()
            $0.size.equalTo(view.frame.size.width/2.5)
        })
        numberLabel.text = Localization.Label.ready.localized
        numberLabel.backgroundColor = UIColor.systemRed
        numberLabel.layer.masksToBounds = true
        numberLabel.layer.cornerRadius = view.frame.size.width/5
        numberLabel.textColor = .white
        numberLabel.adjustsFontSizeToFitWidth = true
        numberLabel.textAlignment = .center
        numberLabel.font = .systemFont(ofSize: view.frame.size.width/5,
                                       weight: .heavy)
        startButton.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.top.equalTo(numberLabel.snp.bottom).offset(40)
            $0.width.equalTo(view.frame.size.width/3)
            $0.height.equalTo(view.frame.size.width/8)
        })
        startButton.backgroundColor = .yellow
        startButton.titleLabel?.adjustsFontSizeToFitWidth = true
        startButton.setTitle(Localization.Button.start.localized, for: .normal)
        startButton.titleLabel?.font = .systemFont(ofSize: view.frame.size.width/17,
                                                   weight: .medium)
        startButton.setTitleColor(.black, for: .normal)
        startButton.titleLabel?.textAlignment = .center
        startButton.addTarget(nil, action: #selector(start), for: .touchUpInside)
        startButton.layer.cornerRadius = 12
        finishButton.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.top.equalTo(numberLabel.snp.bottom).offset(40)
            $0.width.equalTo(view.frame.size.width/3)
            $0.height.equalTo(view.frame.size.width/8)
        })
        finishButton.titleLabel?.font = .systemFont(ofSize: view.frame.size.width/17,
                                                    weight: .medium)
        finishButton.setTitle(Localization.Button.finish.localized, for: .normal)
        finishButton.setTitleColor(.black, for: .normal)
        finishButton.layer.cornerRadius = 12
        finishButton.isHidden = true
        finishButton.titleLabel?.adjustsFontSizeToFitWidth = true
        finishButton.addTarget(nil, action: #selector(finnish), for: .touchUpInside)
        banner.snp.makeConstraints({
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(view.frame.size.height/11)
        })
    }
}

