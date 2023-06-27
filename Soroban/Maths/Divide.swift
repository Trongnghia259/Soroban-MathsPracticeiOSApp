//
//  Divide.swift
//  Soroban
//
//  Created by Tam Nguyen on 18/06/2023.
//

import Foundation
import SnapKit

class Divide: UIViewController {
    var startNumber:Double = 1000
    var repeatsTime = 0
    var timemath = 1
    var speed:Double = 3
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
        setUI()
    }
    @objc func start() {
        numberLabel.text = "\(startNumber)"
        startButton.isHidden = true
        Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { [self] time in
            divide()
            UIView.animate(withDuration: speed/2, animations: { [self] in
                numberLabel.center.x += numberLabel.center.y
            }) { [self] _ in
                UIView.animate(withDuration: speed/2, animations: { [self] in
                    numberLabel.center.x += numberLabel.center.y
                })
                repeatsTime = repeatsTime + 1
                if repeatsTime == timemath {
                    time.invalidate()
                    finishButton.isHidden = false
                    repeatsTime = 0
                }
            }
        }
    }
    func divide() {
        let randomNumber = Double.random(in: 1..<100)
        startNumber = startNumber / randomNumber
        numberLabel.text = "÷\(randomNumber)"
        numberLabel.reloadInputViews()
    }
    @objc func finnish() {
        numberLabel.text = "\(startNumber)"
        reloadInputViews()
        startNumber = 1000
        finishButton.isHidden = true
        startButton.isHidden = false
    }
    func setUI() {
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = backgroundImage
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        view.addSubview(numberLabel)
        view.addSubview(startButton)
        view.addSubview(finishButton)
        numberLabel.snp.makeConstraints({
            $0.center.equalToSuperview()
            $0.size.equalTo(250)
        })
        numberLabel.text = "\(startNumber)"
        numberLabel.backgroundColor = .systemBlue
        numberLabel.layer.masksToBounds = true
        numberLabel.layer.cornerRadius = 125
        numberLabel.textColor = .white
        numberLabel.adjustsFontSizeToFitWidth = true
        numberLabel.textAlignment = .center
        numberLabel.font = .systemFont(ofSize: 70, weight: .heavy)
        startButton.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.top.equalTo(numberLabel).offset(400)
            $0.width.equalTo(200)
            $0.height.equalTo(80)
        })
        startButton.backgroundColor = .yellow
        startButton.setTitle("Start", for: .normal)
        startButton.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        startButton.setTitleColor(.black, for: .normal)
        startButton.titleLabel?.textAlignment = .center
        startButton.addTarget(nil, action: #selector(start), for: .touchUpInside)
        startButton.layer.cornerRadius = 12
        finishButton.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.top.equalTo(numberLabel).offset(400)
            $0.width.equalTo(200)
            $0.height.equalTo(80)
        })
        finishButton.titleLabel?.font = .systemFont(ofSize: 35, weight: .medium)
        finishButton.setTitle("Finish", for: .normal)
        finishButton.setTitleColor(.black, for: .normal)
        finishButton.layer.cornerRadius = 12
        finishButton.isHidden = true
        finishButton.addTarget(nil, action: #selector(finnish), for: .touchUpInside)
    }}
