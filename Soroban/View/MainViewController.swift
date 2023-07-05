//
//  MainViewController.swift
//  Soroban
//
//  Created by Tam Nguyen on 18/06/2023.
//

import UIKit
import GoogleMobileAds
import SnapKit

class MainViewController: UIViewController {
    
    let mathsLabel = UILabel()
    let settingImage = UIBarButtonItem()
    let plusButton = UIButton()
    let MinusButton = UIButton()
    let multiplyButton = UIButton()
    let divideButton = UIButton(type: .system)
    let backgroundImage = UIImage(named: "background4")
    var imageView: UIImageView!
    
    private let banner: GADBannerView = {
        let banner = GADBannerView()
        banner.adUnitID = "ca-app-pub-4835926675743094/4261140919"
        banner.load(GADRequest())
        banner.backgroundColor = .secondarySystemBackground
        return banner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
//        navigationItem.title = Localization.Title.mathsOperations.localized
//        navigationItem.largeTitleDisplayMode = .automatic
//        navigationItem.rightBarButtonItem = settingImage
        
        let langStr = Locale.current.language.languageCode!.identifier
        print(langStr)
        
        addBanner()
        
        imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = backgroundImage
        view.addSubview(imageView)
        view.addSubview(mathsLabel)
        view.addSubview(plusButton)
        view.addSubview(MinusButton)
        view.addSubview(multiplyButton)
        view.addSubview(divideButton)
        setupConstraints()
        setMathsUI()

    }
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
    
    func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.bottom.equalTo(banner.snp.top)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
//        mathsLabel.text = Localization.Title.mathsOperations.localized
        print(mathsLabel)
        mathsLabel.font = .systemFont(ofSize: 60, weight: .heavy)
        mathsLabel.textColor = .black
        mathsLabel.textAlignment = .center
        mathsLabel.adjustsFontSizeToFitWidth = true
        mathsLabel.snp.makeConstraints({
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.top.equalToSuperview().offset(10)
            $0.width.equalTo(view.frame.size.width/2)
            $0.height.equalTo(view.frame.size.width/11)
        })
        settingImage.tintColor = .black
        settingImage.image = UIImage(systemName: "gearshape")
        settingImage.action = #selector(presentSetting)
    }
    func setMathsUI() {
        plusButton.setBackgroundImage(UIImage(systemName: "plus.square.fill"), for: .normal)
        plusButton.contentMode = .scaleAspectFill
        plusButton.tintColor = .systemRed
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.snp.makeConstraints({
            $0.top.equalTo(imageView.snp.top).offset(60)
            $0.right.equalTo(view.snp.centerX).offset(-10)
            $0.size.equalTo(view.frame.size.width/3)
        })
        MinusButton.setBackgroundImage(UIImage(systemName: "minus.square.fill"), for: .normal)
        MinusButton.contentMode = .scaleAspectFill
        MinusButton.tintColor = .systemBlue
        MinusButton.snp.makeConstraints({
            $0.top.equalTo(imageView.snp.top).offset(60)
            $0.left.equalTo(view.snp.centerX).offset(10)
            $0.size.equalTo(view.frame.size.width/3)
        })
        multiplyButton.setBackgroundImage(UIImage(systemName: "multiply.square.fill"), for: .normal)
        multiplyButton.contentMode = .scaleAspectFill
        multiplyButton.tintColor = .systemYellow
        multiplyButton.snp.makeConstraints({
            $0.top.equalTo(plusButton.snp.bottom).offset(10)
            $0.right.equalTo(view.snp.centerX).offset(-10)
            $0.size.equalTo(view.frame.size.width/3)
        })
        divideButton.setBackgroundImage(UIImage(systemName: "divide.square.fill"), for: .normal)
        divideButton.contentMode = .scaleToFill
        divideButton.tintColor = .systemGreen
        divideButton.translatesAutoresizingMaskIntoConstraints = false
        divideButton.snp.makeConstraints({
            $0.top.equalTo(MinusButton.snp.bottom).offset(10)
            $0.left.equalTo(view.snp.centerX).offset(10)
            $0.size.equalTo(view.frame.size.width/3)
        })
        plusButton.addTarget(nil, action: #selector(presentSum), for: .touchUpInside)
        MinusButton.addTarget(nil, action: #selector(presentMinus), for: .touchUpInside)
        multiplyButton.addTarget(nil, action: #selector(presentMultiply), for: .touchUpInside)
        divideButton.addTarget(nil, action: #selector(presentDivide), for: .touchUpInside)
        
    }
    @objc func  presentSum() {
//        navigationController?.pushViewController(Sum(), animated: true)
        show(Sum(), sender: nil)
    }
    @objc func presentMinus() {
        navigationController?.pushViewController(Minus(), animated: true)
    }
    @objc func presentMultiply() {
        navigationController?.pushViewController(Multiply(), animated: true)
    }
    @objc func presentDivide() {
        navigationController?.pushViewController(Comingsoon(), animated: true)
    }
    @objc func presentSetting() {
        present(SettingVC(), animated: true)
    }
}

