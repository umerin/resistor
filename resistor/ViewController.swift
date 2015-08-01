//
//  ViewController.swift
//  resistor
//
//  Created by rin on 2015/07/24.
//  Copyright (c) 2015年 rin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var mainPV: UIPickerView!
    
    let color = [["黒", "茶", "赤", "橙", "黄", "緑", "青", "紫", "灰", "白"],
                ["黒", "茶", "赤", "橙", "黄", "緑", "青", "紫", "灰", "白"],
                ["黒", "茶", "赤", "橙", "黄", "緑", "青", "紫", "灰", "白"],
                ["黒", "茶", "赤", "橙", "黄", "緑", "青", "紫", "灰", "白", "なし", "金", "銀"],
                ["茶", "赤", "金", "銀"]]
    //pickerViewに表示する文字の配列4列目まで
    
    //let rowN:[Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    let gosa:[String] = ["± 1", "± 2", "± 5", "± 10"]
    //pickerViewに表示する文字の配列5列目
    
    let obiColor:[UIColor] = [
        UIColor (red: 0.14, green: 0.14, blue: 0.14, alpha: 1.0),
        UIColor (red: 0.60, green: 0.40, blue: 0.20, alpha: 1.0),
        UIColor (red: 0.99, green: 0.20, blue: 0.25, alpha: 1.0),
        UIColor (red: 0.99, green: 0.53, blue: 0.15, alpha: 1.0),
        UIColor (red: 0.98, green: 0.91, blue: 0.35, alpha: 1.0),
        UIColor (red: 0.02, green: 0.72, blue: 0.11, alpha: 1.0),
        UIColor (red: 0.18, green: 0.36, blue: 0.82, alpha: 1.0),
        UIColor (red: 0.50, green: 0.25, blue: 0.78, alpha: 1.0),
        UIColor (red: 0.61, green: 0.61, blue: 0.61, alpha: 1.0),
        UIColor (red: 0.99, green: 0.99, blue: 0.99, alpha: 1.0),
        UIColor (red: 0.82, green: 0, blue: 0, alpha: 0),
        UIColor (red: 0.60, green: 0.40, blue: 0.20, alpha: 1.0),
        UIColor (red: 0.99, green: 0.20, blue: 0.25, alpha: 1.0),
        UIColor (red: 0.82, green: 0.71, blue: 0.16, alpha: 1.0),
        UIColor (red: 0.87, green: 0.80, blue: 0.73, alpha: 1.0)]
    //抵抗の帯の色を入れてる配列
    
//    var kekka1:String = "1"
//    var kekka2:String = "0"
//    var kekka3:String = "0"
//    var kekka4:String = ""
    
    var number:[Int] = [1, 0, 0, 10 , 2, 0, 0]
    //pickerViewの「各列」の何番目を選択したか格納する配列
    
//    var number1:Int = 1
//    var number2:Int = 0
//    var number3:Int = 0
//    var number4:Int = 10
//    var number5:Int = 0
//    var number6:Int = 0
    
    var kekkaNum:Int = 10
    //抵抗値をいれる
    
//["黒", "茶", "赤", "橙", "黄", "緑", "青", "紫", "灰", "白"]
//        ["黒", "茶", "赤", "橙", "黄", "緑", "青", "紫", "灰", "白"],
//        ["黒", "茶", "赤", "橙", "黄", "緑", "青", "紫", "灰", "白"],
//        ["黒", "茶", "赤", "橙", "黄", "緑", "青", "紫", "灰", "白"],
//        ["黒", "茶", "赤", "橙", "黄", "緑", "青", "紫", "灰", "白", "金", "銀"],
//        ["茶", "赤", "金", "銀"]]

    @IBOutlet weak var color1: UILabel!
    @IBOutlet weak var color2: UILabel!
    @IBOutlet weak var color3: UILabel!
    @IBOutlet weak var color4: UILabel!
    @IBOutlet weak var color5: UILabel!
    @IBOutlet weak var kekka: UILabel!
    @IBOutlet weak var gosaL: UILabel!
    //抵抗の帯とか、ラベルの宣言
    
    func rui (Num: Int, bai: Int) ->Int{
        var i:Int
        var retu:Int = Num;
        for i = 0; i < bai; i++ {
            retu *= 10
        }
        return retu
    }
    //抵抗値を計算する関数
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mainPV.delegate = self
        mainPV.dataSource = self
        //pickerViewのデリゲート
        
        mainPV.selectRow(1, inComponent: 0, animated:false)
        mainPV.selectRow(10, inComponent: 3, animated:false)
        mainPV.selectRow(2, inComponent: 4, animated:false)
        //pickerViewの初期値
        
        //gosaL.text = "±5"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 5
    }
    //pickerViewのドラムの数
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch  component{
        case 0: return 10
        case 1: return 10
        case 2: return 10
        case 3: return 13
        default: return 4
        }
    }
    //各ドラムの項目数
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return  color[component][row] as String
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //選択したとき
        switch component{
        case 0:number[0] = row
        case 1:number[1] = row
        case 2:number[2] = row
        case 3:number[3] = row
        default:gosaL.text = gosa[row] as String
            number[4] = row
        }
        //何個目のドラムで何個目の項目を選択したか
        
        number[5] = ((number[0] * 10) + number[1])
        number[6] = (((number[0] * 100) + number[1] * 10) + number[2])
        //大きな位の計算

        
        if number[3] == 10{
            if number[2] == 0{
                kekkaNum = number[5]
            }else {
                kekkaNum = rui(number[5], bai: number[2])
            }
        }else{
            if number[3] == 0{
                kekkaNum = number[6]
            }else{
                if number[3] == 11{
                    kekkaNum = number[6]
                    kekkaNum = kekkaNum / 10
                }else if kekkaNum == 12{
                    kekkaNum = number[6]
                    kekkaNum = kekkaNum / 100
                }else{
                    kekkaNum = rui(number[6], bai: number[3])
                }
            }
        }
        //抵抗値の計算
        
        color1.backgroundColor = obiColor[number[0]]
        color2.backgroundColor = obiColor[number[1]]
        color3.backgroundColor = obiColor[number[2]]
        if number[3] < 11{
            color4.backgroundColor = obiColor[number[3]]
        }else{
            color4.backgroundColor = obiColor[number[3] + 2]
            println(number[3])
        }
        color5.backgroundColor = obiColor[number[4] + 11]
        //帯の色の変更
        
        kekka.text = "\(kekkaNum)"
        //結果（抵抗値）の表示
    }
}

