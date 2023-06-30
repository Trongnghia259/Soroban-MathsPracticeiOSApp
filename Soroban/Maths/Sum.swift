//
//  Sum.swift
//  Soroban
//
//  Created by Tam Nguyen on 18/06/2023.
//

import Foundation
import SnapKit

class Sum: UIViewController {
    
    var minA = 1
    var maxA = 10
    var minB = 1
    var maxB = 10
    var speeds = 3.0
    var calculator = 5
    
    private lazy var startNumber = Int.random(in: minA..<maxA)
    private var timemath = 5
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
        getValue()
        settingUI()
    }
    @objc func start() {
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
            numberLabel.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
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
             speeds = 2.0
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
        startNumber = Int.random(in: 1..<10)
        finishButton.isHidden = true
        startButton.isHidden = false
    }
    func settingUI() {
        tabBarController?.tabBar.barTintColor = UIColor.white
        imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = backgroundImage
        view.addSubview(imageView)
        view.addSubview(numberLabel)
        view.addSubview(startButton)
        view.addSubview(finishButton)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        numberLabel.snp.makeConstraints({
            $0.center.equalToSuperview()
            $0.size.equalTo(250)
        })
        numberLabel.text = "\(startNumber)"
        numberLabel.backgroundColor = .red
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
        startButton.setTitle("Start".localized(), for: .normal)
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
        finishButton.setTitle("Finish".localized(), for: .normal)
        finishButton.setTitleColor(.black, for: .normal)
        finishButton.layer.cornerRadius = 12
        finishButton.isHidden = true
        finishButton.addTarget(nil, action: #selector(finnish), for: .touchUpInside)
    }
}
