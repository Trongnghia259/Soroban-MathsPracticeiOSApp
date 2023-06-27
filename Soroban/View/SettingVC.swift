//
//  SettingVC.swift
//  Soroban
//
//  Created by Tam Nguyen on 18/06/2023.
//

import Foundation
import UIKit

class SettingVC: UIViewController {
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Setting"
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
    
    let number = ["1","10","100","1000","10000","100000"]
    let speeds = ["Slow", "Normal", "Fast", "Fastest"]
    let calculations = ["1","3","5","10","15","20","25","30"]
    
    var minA: Int!
    var maxA: Int!
    var minB: Int!
    var maxB: Int!
    var speedrun: Double!
    var calculator: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray5
        setUI()
        minimumATextField.inputView = minimumAPickerView
        maximumATextField.inputView = maximumAPickerView
        minimumBTextField.inputView = minimumBPickerView
        maximumBTextField.inputView = maximumBPickerView
        speedTextField.inputView = speedPickerView
        calculationTextField.inputView = calculationPickerView
        
        minimumAPickerView.delegate = self
        maximumAPickerView.delegate = self
        minimumBPickerView.delegate = self
        maximumBPickerView.delegate = self
        speedPickerView.delegate = self
        calculationPickerView.delegate = self

        minimumAPickerView.tag = 1
        maximumAPickerView.tag = 2
        minimumBPickerView.tag = 3
        maximumBPickerView.tag = 4
        speedPickerView.tag = 5
        calculationPickerView.tag = 6
        
        minimumATextField.text = "1"
        maximumATextField.text = "10"
        minimumBTextField.text = "1"
        maximumBTextField.text = "10"
        speedTextField.text = "Normal"
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
        setNumberALabel.text = "Set Random Number A:"
        setNumberALabel.snp.makeConstraints({
            $0.top.equalTo(titleLabel).offset(50)
            $0.left.equalToSuperview().offset(20)
        })
        setMiniumALabel.font = .systemFont(ofSize: 15, weight: .light)
        setMiniumALabel.text = "Minimum A:"
        setMiniumALabel.snp.makeConstraints({
            $0.top.equalTo(setNumberALabel).offset(30)
            $0.left.equalToSuperview().offset(20)
        })
        setMaximumALabel.font = .systemFont(ofSize: 15, weight: .light)
        setMaximumALabel.text = "Maximum A:"
        setMaximumALabel.snp.makeConstraints({
            $0.top.equalTo(setMiniumALabel).offset(30)
            $0.left.equalToSuperview().offset(20)
        })
        setNumberBLabel.text = "Set Random Number B:"
        setNumberBLabel.snp.makeConstraints({
            $0.top.equalTo(setMaximumALabel).offset(50)
            $0.left.equalToSuperview().offset(20)
        })
        setMiniumBLabel.font = .systemFont(ofSize: 15, weight: .light)
        setMiniumBLabel.text = "Minimum B:"
        setMiniumBLabel.snp.makeConstraints({
            $0.top.equalTo(setNumberBLabel).offset(30)
            $0.left.equalToSuperview().offset(20)
        })
        setMaximumBLabel.font = .systemFont(ofSize: 15, weight: .light)
        setMaximumBLabel.text = "Maximum B:"
        setMaximumBLabel.snp.makeConstraints({
            $0.top.equalTo(setMiniumBLabel).offset(30)
            $0.left.equalToSuperview().offset(20)
        })
        setSpeedLabel.text = "Speed :"
        setSpeedLabel.snp.makeConstraints({
            $0.top.equalTo(setMaximumBLabel).offset(50)
            $0.left.equalToSuperview().offset(20)
        })
        setCaculationLabel.text = "Number of Calculations:"
        setCaculationLabel.snp.makeConstraints({
            $0.top.equalTo(setSpeedLabel).offset(50)
            $0.left.equalToSuperview().offset(20)
        })
        minimumATextField.textAlignment = .center
        minimumATextField.translatesAutoresizingMaskIntoConstraints = true
        minimumATextField.backgroundColor = .white
        minimumATextField.snp.makeConstraints({
            $0.top.equalTo(titleLabel).offset(80)
            $0.right.equalToSuperview().offset(-30)
            $0.width.equalTo(150)
        })
        maximumATextField.textAlignment = .center
        maximumATextField.backgroundColor = .white
        maximumATextField.snp.makeConstraints({
            $0.top.equalTo(minimumATextField).offset(30)
            $0.right.equalToSuperview().offset(-30)
            $0.width.equalTo(150)
        })
        minimumBTextField.textAlignment = .center
        minimumBTextField.translatesAutoresizingMaskIntoConstraints = true
        minimumBTextField.backgroundColor = .white
        minimumBTextField.snp.makeConstraints({
            $0.top.equalTo(maximumATextField).offset(80)
            $0.right.equalToSuperview().offset(-30)
            $0.width.equalTo(150)
        })
        maximumBTextField.textAlignment = .center
        maximumBTextField.backgroundColor = .white
        maximumBTextField.snp.makeConstraints({
            $0.top.equalTo(minimumBTextField).offset(30)
            $0.right.equalToSuperview().offset(-30)
            $0.width.equalTo(150)
        })
        speedTextField.textAlignment = .center
        speedTextField.translatesAutoresizingMaskIntoConstraints = true
        speedTextField.backgroundColor = .white
        speedTextField.snp.makeConstraints({
            $0.top.equalTo(maximumBTextField).offset(50)
            $0.right.equalToSuperview().offset(-30)
            $0.width.equalTo(150)
        })
        calculationTextField.textAlignment = .center
        calculationTextField.backgroundColor = .white
        calculationTextField.snp.makeConstraints({
            $0.top.equalTo(speedTextField).offset(50)
            $0.right.equalToSuperview().offset(-30)
            $0.width.equalTo(150)
        })
        finishButton.layer.cornerRadius = 12
        finishButton.setTitle("Confirm", for: .normal)
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
        ruleLabel.text = "* For Example: ( a + b ) \n Minimum < Maximum \n Number A = minimumA -> maxximumA \n Number B = minimumB -> maxximumB "
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
        switch pickerView.tag {
        case 1:
            return number.count
        case 2:
            return number.count
        case 3:
            return number.count
        case 4:
            return number.count
        case 5:
            return speeds.count
        case 6:
            return calculations.count
        default:
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return number[row]
        case 2:
            return number[row]
        case 3:
            return number[row]
        case 4:
            return number[row]
        case 5:
            return speeds[row]
        case 6:
            return calculations[row]
        default:
            return "Data not found."
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            minimumATextField.text = number[row]
            minimumATextField.resignFirstResponder()
        case 2:
            maximumATextField.text = number[row]
            maximumATextField.resignFirstResponder()
        case 3:
            minimumBTextField.text = number[row]
            minimumBTextField.resignFirstResponder()
        case 4:
            maximumBTextField.text = number[row]
            maximumBTextField.resignFirstResponder()
        case 5:
            speedTextField.text = speeds[row]
            speedTextField.resignFirstResponder()
        case 6:
            calculationTextField.text = calculations[row]
            calculationTextField.resignFirstResponder()
        default:
            return
        }

    }
    
    
}
