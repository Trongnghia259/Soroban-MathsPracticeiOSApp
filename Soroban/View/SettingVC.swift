//
//  SettingVC.swift
//  Soroban
//
//  Created by Tam Nguyen on 18/06/2023.
//

import Foundation
import UIKit

class SettingVC: UIViewController, UITextFieldDelegate {
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Setting".localized()
        title.font = .systemFont(ofSize: 30, weight: .light)
        title.textColor = .black
        return title
    }()
    private let finishButton: UIButton = {
        let sButton = UIButton()
        sButton.backgroundColor = .red
        sButton.translatesAutoresizingMaskIntoConstraints = false
        return sButton
    }()
    private let setNumberALabel = UILabel()
    private let setMiniumALabel = UILabel()
    private let setMaximumALabel = UILabel()
    private let setNumberBLabel = UILabel()
    private let setMiniumBLabel = UILabel()
    private let setMaximumBLabel = UILabel()
    private let setSpeedLabel = UILabel()
    private let setCaculationLabel = UILabel()
    private let ruleLabel = UILabel()
    
    let minimumATextField = UITextField()
    let minimumBTextField = UITextField()
    let maximumATextField = UITextField()
    let maximumBTextField = UITextField()
    let speedTextField = UITextField()
    let calculationTextField = UITextField()

    var minimumAPickerView = UIPickerView()
    var minimumBPickerView = UIPickerView()
    var maximumAPickerView = UIPickerView()
    var maximumBPickerView = UIPickerView()
    var speedPickerView = UIPickerView()
    var calculationPickerView = UIPickerView()
    
    let speeds = ["Slow".localized(),
                  "Normal".localized(),
                  "Fast".localized(),
                  "Very Fast".localized()]
    
    var minA: Int!
    var maxA: Int!
    var minB: Int!
    var maxB: Int!
    var speedrun: Double!
    var calculator: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        minimumATextField.keyboardType = .asciiCapableNumberPad
        
        view.backgroundColor = .systemGray5
        setUI()
        minimumATextField.delegate = self
        maximumATextField.delegate = self
        minimumBTextField.delegate = self
        maximumBTextField.delegate = self
        calculationTextField.delegate = self

        speedTextField.inputView = speedPickerView
        speedPickerView.delegate = self
        
        minimumATextField.text = "50"
        maximumATextField.text = "100"
        minimumBTextField.text = "1"
        maximumBTextField.text = "10"
        speedTextField.text = "Fast".localized()
        calculationTextField.text = "5"

    }
    
    func comfirmData() {
        
        var speedd: Double {
            switch speedTextField.text {
            case "Slow":
                return 4
            case "Normal":
                return 3
            case "Fast":
                return 2
            case "Fastest":
                return 1
            case .some(_):
                return 1
            case .none:
                fatalError("None of Number")
            }
        }
        minA = Int(minimumATextField.text ?? "")
        maxA = Int(maximumATextField.text ?? "")
        minB = Int(minimumBTextField.text ?? "")
        maxB = Int(maximumBTextField.text ?? "")
        speedrun = speedd
        calculator = Int(calculationTextField.text ?? "")
        UserDefaults.standard.set(minA, forKey: "minA")
        UserDefaults.standard.set(maxA, forKey: "maxA")
        UserDefaults.standard.set(minB, forKey: "minB")
        UserDefaults.standard.set(maxB, forKey: "maxB")
        UserDefaults.standard.set(speedrun, forKey: "speed")
        UserDefaults.standard.set(calculator, forKey: "calculator")
    }
    
    func setUI() {
        view.addSubview(titleLabel)
        view.addSubview(finishButton)
        view.addSubview(setNumberALabel)
        view.addSubview(setMiniumALabel)
        view.addSubview(setMaximumALabel)
        view.addSubview(setNumberBLabel)
        view.addSubview(setMiniumBLabel)
        view.addSubview(setMaximumBLabel)
        view.addSubview(setSpeedLabel)
        view.addSubview(setCaculationLabel)
        view.addSubview(ruleLabel)
        
        view.addSubview(minimumATextField)
        view.addSubview(minimumBTextField)
        view.addSubview(maximumBTextField)
        view.addSubview(maximumATextField)
        view.addSubview(speedTextField)
        view.addSubview(calculationTextField)

        titleLabel.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(50)
        })
        setNumberALabel.text = "Set Random Number A:".localized()
        setNumberALabel.snp.makeConstraints({
            $0.top.equalTo(titleLabel).offset(50)
            $0.left.equalToSuperview().offset(20)
        })
        setMiniumALabel.font = .systemFont(ofSize: 15, weight: .light)
        setMiniumALabel.text = "From".localized()
        setMiniumALabel.snp.makeConstraints({
            $0.top.equalTo(setNumberALabel).offset(50)
            $0.left.equalToSuperview().offset(20)

        })
        minimumATextField.textAlignment = .center
        minimumATextField.backgroundColor = .white
        minimumATextField.layer.cornerRadius = 12
        minimumATextField.snp.makeConstraints({
            $0.top.equalTo(setNumberALabel).offset(30)
            $0.left.equalTo(setMiniumALabel.safeAreaLayoutGuide.snp.right).offset(10)
            $0.height.equalTo(50)
            $0.width.equalTo(100)
        })
        setMaximumALabel.font = .systemFont(ofSize: 15, weight: .light)
        setMaximumALabel.text = "To".localized()
        setMaximumALabel.snp.makeConstraints({
            $0.top.equalTo(setNumberALabel).offset(50)
            $0.left.equalTo(minimumATextField.safeAreaLayoutGuide.snp.right).offset(10)
        })
        maximumATextField.textAlignment = .center
        maximumATextField.backgroundColor = .white
        maximumATextField.layer.cornerRadius = 12
        maximumATextField.snp.makeConstraints({
            $0.top.equalTo(setNumberALabel).offset(30)
            $0.left.equalTo(setMaximumALabel.safeAreaLayoutGuide.snp.right).offset(10)
            $0.height.equalTo(50)
            $0.width.equalTo(100)
        })

        setNumberBLabel.text = "Set Random Number B:".localized()
        setNumberBLabel.snp.makeConstraints({
            $0.top.equalTo(setMaximumALabel).offset(50)
            $0.left.equalToSuperview().offset(20)
        })
        setMiniumBLabel.font = .systemFont(ofSize: 15, weight: .light)
        setMiniumBLabel.text = "From".localized()
        setMiniumBLabel.snp.makeConstraints({
            $0.top.equalTo(setNumberBLabel).offset(50)
            $0.left.equalToSuperview().offset(20)
        })
        setMaximumBLabel.font = .systemFont(ofSize: 15, weight: .light)
        setMaximumBLabel.text = "To".localized()
        setMaximumBLabel.snp.makeConstraints({
            $0.top.equalTo(setNumberBLabel).offset(50)
            $0.left.equalTo(minimumBTextField.safeAreaLayoutGuide.snp.right).offset(10)
        })
        minimumBTextField.textAlignment = .center
        minimumBTextField.backgroundColor = .white
        minimumBTextField.layer.cornerRadius = 12
        minimumBTextField.snp.makeConstraints({
            $0.top.equalTo(setNumberBLabel).offset(30)
            $0.left.equalTo(setMiniumBLabel.safeAreaLayoutGuide.snp.right).offset(10)
            $0.height.equalTo(50)
            $0.width.equalTo(100)
        })
        maximumBTextField.textAlignment = .center
        maximumBTextField.backgroundColor = .white
        maximumBTextField.layer.cornerRadius = 12
        maximumBTextField.snp.makeConstraints({
            $0.top.equalTo(setNumberBLabel).offset(30)
            $0.left.equalTo(setMaximumBLabel.safeAreaLayoutGuide.snp.right).offset(10)
            $0.height.equalTo(50)
            $0.width.equalTo(100)
        })
        
        setSpeedLabel.text = "Speed :".localized()
        setSpeedLabel.snp.makeConstraints({
            $0.top.equalTo(setMaximumBLabel.safeAreaLayoutGuide.snp.bottom).offset(50)
            $0.left.equalToSuperview().offset(20)
        })
        speedTextField.textAlignment = .center
        speedTextField.layer.cornerRadius = 12
        speedTextField.backgroundColor = .white
        speedTextField.snp.makeConstraints({
            $0.top.equalTo(maximumBTextField.safeAreaLayoutGuide.snp.bottom).offset(30)
            $0.left.equalTo(setSpeedLabel).offset(200)
            $0.width.equalTo(150)
            $0.height.equalTo(50)
        })
        setCaculationLabel.text = "Number of Calculations:".localized()
        setCaculationLabel.snp.makeConstraints({
            $0.top.equalTo(setSpeedLabel.safeAreaLayoutGuide.snp.bottom).offset(70)
            $0.left.equalToSuperview().offset(20)
        })
        calculationTextField.textAlignment = .center
        calculationTextField.backgroundColor = .white
        calculationTextField.layer.cornerRadius = 12
        calculationTextField.snp.makeConstraints({
            $0.top.equalTo(speedTextField.safeAreaLayoutGuide.snp.bottom).offset(30)
            $0.left.equalTo(setCaculationLabel).offset(200)
            $0.width.equalTo(150)
            $0.height.equalTo(50)
        })
        finishButton.layer.cornerRadius = 12
        finishButton.setTitle("Confirm".localized(), for: .normal)
        finishButton.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-50)
            $0.width.equalTo(200)
            $0.height.equalTo(80)
        })
        finishButton.addTarget(nil, action: #selector(presentVC), for: .touchUpInside)
        ruleLabel.snp.makeConstraints({
            $0.top.equalTo(setCaculationLabel).offset(50)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalTo(360)
        })
        ruleLabel.numberOfLines = 0
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) != nil {
          return true
       } else {
          return false
       }
    }
    @objc func presentVC() {
        comfirmData()
        dismiss(animated: true, completion: nil)
    }
}

extension SettingVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return speeds.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return speeds[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        speedTextField.text = speeds[row]
        speedTextField.resignFirstResponder()
    }}
