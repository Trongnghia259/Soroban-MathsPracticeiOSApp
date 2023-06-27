//
//  Minus.swift
//  Soroban
//
//  Created by Tam Nguyen on 18/06/2023.
//

import Foundation
import SnapKit

class Minus: UIViewController {
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
        setUI()
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
             maxA = 100
             minB = 1
             maxB = 20
             speeds = 2.0
             calculator = 5
        }
        speed = speeds
        timemath = calculator
    }
    @objc func start() {
        numberLabel.text = "\(startNumber)"
        startButton.isHidden = true
        openAnimate()
        Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { [self] time in
            minus()
            repeatsTime = repeatsTime + 1
            if repeatsTime == timemath {
                time.invalidate()
                finishButton.isHidden = false
                repeatsTime = 0
            }
            openAnimate()
        }
    }
    func openAnimate() {
        UIView.animate(withDuration: speed/2, animations: { [self] in
            numberLabel.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            numberLabel.center = view.center
        })
    }
    func minus() {
        let randomNumber = Int.random(in: minB..<maxB)
        if startNumber <= randomNumber {
            let randomNumbers = Int.random(in: 0..<startNumber)
            startNumber = startNumber - randomNumbers
            numberLabel.text = "-\(randomNumbers)"
        } else {
            startNumber = startNumber - randomNumber
            numberLabel.text = "-\(randomNumber)"
        }
        numberLabel.reloadInputViews()
    }
    @objc func finnish() {
        numberLabel.text = "\(startNumber)"
        reloadInputViews()
        startNumber = Int.random(in: minA..<maxA)
        finishButton.isHidden = true
        startButton.isHidden = false
    }
    func setUI() {
        navigationController?.navigationBar.backItem?.titleView?.backgroundColor = .black
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = backgroundImage
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
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
        numberLabel.backgroundColor = .systemBlue
        numberLabel.layer.masksToBounds = true
        numberLabel.adjustsFontSizeToFitWidth = true
        numberLabel.layer.cornerRadius = 125
        numberLabel.textColor = .white
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
    }
}
