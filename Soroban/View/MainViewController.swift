//
//  MainViewController.swift
//  Soroban
//
//  Created by Tam Nguyen on 18/06/2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let mathsLabel = UILabel()
    let settingImage = UIButton()
    let plusButton = UIButton()
    let MinusButton = UIButton()
    let multiplyButton = UIButton()
    let divideButton = UIButton(type: .system)
    let backgroundImage = UIImage(named: "background4")
    var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let langStr = Locale.current.language.languageCode!.identifier
        print(langStr)
        
        imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = backgroundImage
        view.addSubview(imageView)
        view.addSubview(mathsLabel)
        view.addSubview(settingImage)
        view.addSubview(plusButton)
        view.addSubview(MinusButton)
        view.addSubview(multiplyButton)
        view.addSubview(divideButton)
        setupConstraints()
        setMathsUI()
        
    }
    func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        mathsLabel.text = Localization.Title.mathsOperations.localized
        print(mathsLabel)
        mathsLabel.font = .systemFont(ofSize: 60, weight: .heavy)
        mathsLabel.textColor = .black
        mathsLabel.textAlignment = .center
        mathsLabel.adjustsFontSizeToFitWidth = true
        mathsLabel.snp.makeConstraints({
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.width.equalToSuperview().multipliedBy(0.7)
            $0.height.equalToSuperview().multipliedBy(0.1)
        })
        settingImage.tintColor = .black
        settingImage.setBackgroundImage(UIImage(systemName: "gearshape"), for: .normal)
        settingImage.addTarget(nil, action: #selector(presentSetting), for: .touchUpInside)
        settingImage.snp.makeConstraints({
            $0.top.equalTo(mathsLabel.snp.bottom).offset(30)
            $0.leading.equalTo(plusButton.snp.trailing).offset(10)
            $0.width.equalToSuperview().multipliedBy(0.2)
            $0.height.equalToSuperview().multipliedBy(0.1)
        })
    }
    func setMathsUI() {
        plusButton.setBackgroundImage(UIImage(systemName: "plus.square.fill"), for: .normal)
        plusButton.contentMode = .scaleAspectFill
        plusButton.tintColor = .systemRed
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.snp.makeConstraints({
            $0.top.equalTo(mathsLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.width.equalToSuperview().multipliedBy(0.28)
            $0.height.equalToSuperview().multipliedBy(0.15)
        })
        MinusButton.setBackgroundImage(UIImage(systemName: "minus.square.fill"), for: .normal)
        MinusButton.contentMode = .scaleAspectFill
        MinusButton.tintColor = .systemBlue
        MinusButton.snp.makeConstraints({
            $0.topMargin.equalTo(plusButton.snp.bottom).offset(10)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.width.equalToSuperview().multipliedBy(0.28)
            $0.height.equalToSuperview().multipliedBy(0.15)
        })
        multiplyButton.setBackgroundImage(UIImage(systemName: "multiply.square.fill"), for: .normal)
        multiplyButton.contentMode = .scaleAspectFill
        multiplyButton.tintColor = .systemYellow
        multiplyButton.snp.makeConstraints({
            $0.top.equalTo(MinusButton.snp.bottom).offset(10)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.width.equalToSuperview().multipliedBy(0.28)
            $0.height.equalToSuperview().multipliedBy(0.15)
        })
        divideButton.setBackgroundImage(UIImage(systemName: "divide.square.fill"), for: .normal)
        divideButton.contentMode = .scaleToFill
        divideButton.tintColor = .systemGreen
        divideButton.translatesAutoresizingMaskIntoConstraints = false
        divideButton.snp.makeConstraints({
            $0.top.equalTo(multiplyButton.snp.bottom).offset(10)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.width.equalToSuperview().multipliedBy(0.28)
            $0.height.equalToSuperview().multipliedBy(0.15)
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

