//
//  ViewController.swift
//  UpDownGame
//
//  Created by 김혜진 on 2020/10/29.
//

import UIKit

class ViewController: UIViewController {

    var randomValue: Int = 0
    var tryCount: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal) // 평소 상태일 때 이미지를 넣어줌
        reset()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        //print(sender.value)
        let integerValue: Int = Int(sender.value)
        sliderValueLabel.text = String(integerValue)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action) in
                                        self.reset()
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        //print(slider.value)
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue) // slider는 실수 타입이므로 정수형으로 변환해서 소수점을 버리고 실수형으로 다시 넣어줌
        
        tryCount += 1
        tryCountLabel.text = "\(tryCount) / 5" // String(tryCount) + " /5"을 문자열 보간법으로 변경
        
        if hitValue == randomValue {
            showAlert(message: "YOU HIT!!!")
            reset()
        } else if tryCount >= 5 {
            showAlert(message: "YOU LOSE...")
            reset()
        } else if hitValue < randomValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        } else {
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
    }
    
    @IBAction func touchUpResetButton(_ sender:UIButton) {
        reset()
    }
    
    func reset() {
        print("reset!!")
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        tryCount = 0
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        tryCountLabel.text = "0 / 5"
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }
}
