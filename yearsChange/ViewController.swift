//
//  ViewController.swift
//  yearsChange
//
//  Created by 林祐辰 on 2020/5/2.
//  Copyright © 2020 smirkiiiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let image = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"]
    var number = 0
    var pickerDateString = ""
    var changeDateFormat = DateFormatter()
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var showDate: UIDatePicker!
    @IBOutlet weak var dateSlider: UISlider!
    var tiktokTimer :Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showDate.setValue(UIColor.white, forKeyPath: "textColor")
        showDate.locale = Locale(identifier: "Chinese")
        decideCarousel()
        changeDateFormat.dateFormat = "yyyy/MM/dd"
    }

    func decideCarousel(){
        tiktokTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector:#selector(doCarousel) , userInfo: nil, repeats: true)
//        tiktokTimer=Timer.scheduledTimer(withTimeInterval: 3, repeats: true){(timer) in self.doCarousel()}
    }

@objc func doCarousel(){
  
        if(number >= image.count){
            number = 0
            pickerDate(pickerNum:number)
            showImage.image = UIImage(named: image[number])
        }else{
            pickerDate(pickerNum:number)
            showImage.image = UIImage(named: image[number])
        }
        
       dateSlider.value = Float(number)
        number+=1
    }
    
    
    @IBAction func carouselSlider(_ sender: UISlider) {
        let newSliderNum = round(sender.value)
        let floatToInt = Int(newSliderNum)
        showImage.image = UIImage(named: image[floatToInt])
        pickerDate(pickerNum:floatToInt)
    }
    
    
    @IBAction func carouselSwitch(_ sender: UISwitch) {
        sender.isOn ? decideCarousel() : tiktokTimer?.invalidate()
    }
    
    
    func pickerDate(pickerNum:Int){
        
        switch pickerNum{
          case 0:
              pickerDateString = "1996/06/23"
          case 1:
              pickerDateString = "1997/02/07"
          case 2:
              pickerDateString = "1999/07/18"
          case 3:
              pickerDateString = "2001/12/01"
          case 4:
              pickerDateString = "2003/04/18"
          case 5:
              pickerDateString = "2006/02/11"
          case 6:
              pickerDateString = "2008/07/14"
          case 7:
              pickerDateString = "2010/08/27"
          case 8:
              pickerDateString = "2014/11/10"
          case 9:
              pickerDateString = "2018/06/13"
        default:
            pickerDateString = "1996/06/23"
        }

        let dateStringToPicker = changeDateFormat.date(from : pickerDateString)
        showDate.date = dateStringToPicker!
        
        }
    }
    

