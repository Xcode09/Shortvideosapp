//
//  ViewController.swift
//  QuizApp
//
//  Created by Test on 23/10/2023.
//

import UIKit
import SwiftUI

class MatchQuizController: UIViewController {
    
    @IBOutlet weak var checkAnswerBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pupleMainView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var btn5: UIButton!
    
    @IBOutlet weak var btn6: UIButton!
    
    @IBOutlet weak var btn7: UIButton!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var completeQuizBtn: UIButton!
    @IBOutlet weak var watchBtn: UIButton!
    @IBOutlet weak var dailyBtn: UIButton!
    @IBOutlet weak var ptsLabel: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    var sourceCGPoint:CGPoint = .zero
    var targetCGPoint:CGPoint = .zero
    
    var sourcePoints:[CGPoint] = []
    var targetPoints:[CGPoint] = []
    var lineLayer: [CAShapeLayer] = []
    var isSource = true
    var selectedColor = UIColor.gray.cgColor
    var lastButtonSelected: UIButton?
    
    
    @IBOutlet weak var quizButtonImage3: UIImageView!
    @IBOutlet weak var quizButtonCheckImage2: UIImageView!
    @IBOutlet weak var quizButtonCheckImage1: UIImageView!
    @IBOutlet weak var quizButton3: UIButton!
    @IBOutlet weak var quizButton2: UIButton!
    @IBOutlet weak var quizButton1: UIButton!
    
    @IBOutlet weak var quizButtonView3: UIView!
    @IBOutlet weak var quizButtonView2: UIView!
    @IBOutlet weak var quizButtonView1: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a UIBezierPath
        pupleMainView.layer.cornerRadius = 40
        mainView.layer.cornerRadius = 30
        self.navigationItem.hidesBackButton = true
        //completeQuizBtn.layer.cornerRadius = 8.0
        //watchBtn.layer.cornerRadius = 8.0
        //dailyBtn.layer.cornerRadius = 8.0
        //ptsLabel.layer.cornerRadius = 8.0
        scrollView.layer.cornerRadius = 30
        scrollView.layer.borderColor = UIColor.black.cgColor
        scrollView.layer.borderWidth = 2
        
        checkAnswerBtn.layer.borderWidth = 2
        checkAnswerBtn.layer.cornerRadius = 28
        checkAnswerBtn.layer.borderColor = UIColor.black.cgColor
        
        quizButtonView1.layer.borderWidth = 2
        quizButtonView1.layer.borderColor = UIColor.black.cgColor
        quizButtonView1.layer.cornerRadius = 14
        quizButtonView1.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        quizButtonView2.layer.borderWidth = 2
        quizButtonView2.layer.borderColor = UIColor.black.cgColor
        quizButtonView2.layer.cornerRadius = 14
        quizButtonView2.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        quizButtonView3.layer.borderWidth = 2
        quizButtonView3.layer.borderColor = UIColor.black.cgColor
        quizButtonView3.layer.cornerRadius = 14
        quizButtonView3.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        btn1.layer.cornerRadius = 10
        btn2.layer.cornerRadius = 10
        btn3.layer.cornerRadius = 10
        btn4.layer.cornerRadius = 10
        btn5.layer.cornerRadius = 10
        btn6.layer.cornerRadius = 10
        btn7.layer.cornerRadius = 10
        btn8.layer.cornerRadius = 10

        btn1.applyBorderWithColor("blueColor")
        btn2.applyBorderWithColor("grey")
        btn3.applyBorderWithColor("pinkColor")
        btn4.applyBorderWithColor("grey")
        btn5.applyBorderWithColor("yellowColor")
        btn6.applyBorderWithColor("grey")
        btn7.applyBorderWithColor("green")
        btn8.applyBorderWithColor("grey")

        

        




        // Load your image
        if let originalImage = UIImage(named: "profile") {
            

            let angleInRadians: CGFloat = .pi / 2
            // Create a new size for the rotated image (you may need to adjust this based on your needs)
            let rotatedSize = CGRect(origin: CGPoint.zero, size: originalImage.size).applying(CGAffineTransform(rotationAngle: angleInRadians)).size
            
            // Create a new context for the rotated image
            UIGraphicsBeginImageContext(rotatedSize)
            
            if let context = UIGraphicsGetCurrentContext() {
                // Move the origin to the middle of the image
                context.translateBy(x: rotatedSize.width / 2, y: rotatedSize.height / 2)
                
                // Rotate the image
                context.rotate(by: angleInRadians)
                
                // Draw the original image, which will now be rotated
                originalImage.draw(in: CGRect(x: -originalImage.size.width / 2, y: -originalImage.size.height / 2, width: originalImage.size.width, height: originalImage.size.height))
                
                // Get the rotated image from the context
                if let rotatedImage = UIGraphicsGetImageFromCurrentImageContext() {
                    UIGraphicsEndImageContext()
                    
                    // Set the rotated image to the UIImageView
                    profileImage.image = rotatedImage
                    
                }
            }
        }


        

        
        
    }
    func setGrayColor(){
        lastButtonSelected?.layer.borderColor = UIColor.gray.cgColor
    }
    @IBAction func checkAnswerAction(_ sender: Any) {
        let vc = UIHostingController(rootView: FillintheBlanksQuizView())
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func quizButton1Click(_ sender: Any) {
        quizButtonCheckImage1.isHidden = false
        quizButtonCheckImage2.isHidden = true
        quizButtonImage3.isHidden = true
//        pupleMainView.backgroundColor = UIColor(red: 193, green: 245, blue: 255, alpha: 1)
        
        //rgba(193, 245, 255, 1)
    }
    
    @IBAction func quizButton2Click(_ sender: Any) {
        quizButtonCheckImage1.isHidden = true
        quizButtonCheckImage2.isHidden = false
        quizButtonImage3.isHidden = true
//        pupleMainView.backgroundColor = UIColor(red: 155, green: 244, blue: 189, alpha: 1)
        
        //rgba(155, 244, 189, 1)
    }
    
    @IBAction func quizButton3Click(_ sender: Any) {
        quizButtonCheckImage1.isHidden = true
        quizButtonCheckImage2.isHidden = true
        quizButtonImage3.isHidden = false
//        pupleMainView.backgroundColor = UIColor(red: 228, green: 154, blue: 250, alpha: 1)
        
        
    }
    
    @IBAction func btn1Action(_ sender: UIButton) {

        if sourcePoints.last == CGPoint(x: sender.frame.midX+55, y: sender.frame.midY) {return}
        isSource = true
        if let index = self.sourcePoints.firstIndex(where: {$0 == CGPoint(x: sender.frame.midX+55, y: sender.frame.midY)}) {
            if self.lineLayer.count > index {
                self.sourcePoints.remove(at: index)
                self.targetPoints.remove(at: index)
                lineLayer.remove(at: index).removeFromSuperlayer()
            }
        }
        if isSource {
            self.sourcePoints.append(CGPoint(x: sender.frame.midX+55, y: sender.frame.midY))
        }else{
            self.targetPoints.append(CGPoint(x: sender.frame.midX+55, y: sender.frame.midY))

        }
        isSource.toggle()
 
        selectedColor = sender.layer.borderColor!
        lastButtonSelected = nil
    }
    
    @IBAction func btn2Action(_ sender: UIButton) {
        if sourcePoints.last == CGPoint(x: sender.frame.midX-55, y: sender.frame.midY) {return}
        if isSource {
            self.sourcePoints.append(CGPoint(x: sender.frame.midX-55, y: sender.frame.midY))
        }else{
            if sourcePoints.count == targetPoints.count {
                self.targetPoints.removeLast()
                self.lineLayer.removeLast().removeFromSuperlayer()
                self.targetPoints.append(CGPoint(x: sender.frame.midX-55, y: sender.frame.midY))
            }else{
                self.targetPoints.append(CGPoint(x: sender.frame.midX-55, y: sender.frame.midY))
            }

        }
        setGrayColor()
        drawLine()
        lastButtonSelected = sender
        sender.layer.borderColor = selectedColor
    }
    @IBAction func btn3Action(_ sender: UIButton) {
        if sourcePoints.last == CGPoint(x: sender.frame.midX+55, y: sender.frame.midY) {return}

        isSource = true
        if let index = self.sourcePoints.firstIndex(where: {$0 == CGPoint(x: sender.frame.midX+55, y: sender.frame.midY)}) {
            if self.lineLayer.count > index {
                self.sourcePoints.remove(at: index)
                self.targetPoints.remove(at: index)
                self.lineLayer.remove(at: index).removeFromSuperlayer()
            }
        }
        if isSource {
            self.sourcePoints.append(CGPoint(x: sender.frame.midX+55, y: sender.frame.midY))
        }else{
            self.targetPoints.append(CGPoint(x: sender.frame.midX+55, y: sender.frame.midY))

        }
        isSource.toggle()
        selectedColor = sender.layer.borderColor!
        lastButtonSelected = nil

    }
    
    @IBAction func btn4Action(_ sender: UIButton) {
        if sourcePoints.last == CGPoint(x: sender.frame.midX-55, y: sender.frame.midY) {return}

        if isSource {
            self.sourcePoints.append(CGPoint(x: sender.frame.midX-55, y: sender.frame.midY))
        }else{
            if sourcePoints.count == targetPoints.count {
                self.targetPoints.removeLast()
                self.lineLayer.removeLast().removeFromSuperlayer()
                self.targetPoints.append(CGPoint(x: sender.frame.midX-55, y: sender.frame.midY))
            }else{
                self.targetPoints.append(CGPoint(x: sender.frame.midX-55, y: sender.frame.midY))
            }

        }
//        setGrayColor()
//        sender.layer.borderColor = selectedColor
//        drawLine()
        setGrayColor()
        drawLine()
        lastButtonSelected = sender
        sender.layer.borderColor = selectedColor
    }
    @IBAction func btn5Action(_ sender: UIButton) {
        if sourcePoints.last == CGPoint(x: sender.frame.midX+55, y: sender.frame.midY) {return}

        isSource = true
        if let index = self.sourcePoints.firstIndex(where: {$0 == CGPoint(x: sender.frame.midX+55, y: sender.frame.midY)}) {
            if self.lineLayer.count > index {
                self.sourcePoints.remove(at: index)
                self.targetPoints.remove(at: index)
                self.lineLayer.remove(at: index).removeFromSuperlayer()
            }
        }
        if isSource {
            self.sourcePoints.append(CGPoint(x: sender.frame.midX+55, y: sender.frame.midY))
        }else{
            self.targetPoints.append(CGPoint(x: sender.frame.midX+55, y: sender.frame.midY))

        }
        isSource.toggle()
        selectedColor = sender.layer.borderColor!
        lastButtonSelected = nil


    }
    @IBAction func btn6Action(_ sender: UIButton) {
        if sourcePoints.last == CGPoint(x: sender.frame.midX-55, y: sender.frame.midY) {return}


        if isSource {
            self.sourcePoints.append(CGPoint(x: sender.frame.midX-55, y: sender.frame.midY))
        }else{
            if sourcePoints.count == targetPoints.count {
                self.targetPoints.removeLast()
                self.lineLayer.removeLast().removeFromSuperlayer()
                self.targetPoints.append(CGPoint(x: sender.frame.midX-55, y: sender.frame.midY))
            }else{
                self.targetPoints.append(CGPoint(x: sender.frame.midX-55, y: sender.frame.midY))
            }

        }
//        setGrayColor()
//        sender.layer.borderColor = selectedColor
//        drawLine()
        setGrayColor()
        drawLine()
        lastButtonSelected = sender
        sender.layer.borderColor = selectedColor
    }
    
    
    @IBAction func btn7Action(_ sender: UIButton) {
        if sourcePoints.last == CGPoint(x: sender.frame.midX+55, y: sender.frame.midY) {return}


        isSource = true
        if let index = self.sourcePoints.firstIndex(where: {$0 == CGPoint(x: sender.frame.midX+55, y: sender.frame.midY)}) {
            if self.lineLayer.count > index {
                self.sourcePoints.remove(at: index)
                self.targetPoints.remove(at: index)
                self.lineLayer.remove(at: index).removeFromSuperlayer()
            }
        }
        if isSource {
            self.sourcePoints.append(CGPoint(x: sender.frame.midX+55, y: sender.frame.midY))
        }else{
            self.targetPoints.append(CGPoint(x: sender.frame.midX+55, y: sender.frame.midY))

        }
        isSource.toggle()
        selectedColor = sender.layer.borderColor!
        lastButtonSelected = nil


    }
    
    @IBAction func btn8Action(_ sender: UIButton) {
        if sourcePoints.last == CGPoint(x: sender.frame.midX-55, y: sender.frame.midY) {return}

        if isSource {
            self.sourcePoints.append(CGPoint(x: sender.frame.midX-55, y: sender.frame.midY))
        }else{
            if sourcePoints.count == targetPoints.count {
                self.targetPoints.removeLast()
                self.lineLayer.removeLast().removeFromSuperlayer()
                self.targetPoints.append(CGPoint(x: sender.frame.midX-55, y: sender.frame.midY))
            }else{
                self.targetPoints.append(CGPoint(x: sender.frame.midX-55, y: sender.frame.midY))
            }

        }
      
//        setGrayColor()
//        sender.layer.borderColor = selectedColor
//        drawLine()
        setGrayColor()
        drawLine()
        lastButtonSelected = sender
        sender.layer.borderColor = selectedColor
        checkAnswerBtn.isEnabled = true
        checkAnswerBtn.setTitle("Check Answer", for: .normal)
        
    }
    
    func drawLine() {

            let linePath = UIBezierPath()

            if targetPoints.count != sourcePoints.count {
                return
            }

        let controlPoint1 = CGPoint(x: sourcePoints.last!.x + 50, y: sourcePoints.last!.y )
        let controlPoint2 = CGPoint(x: targetPoints.last!.x - 50, y: targetPoints.last!.y )




        linePath.move(to: sourcePoints.last!)
        linePath.addCurve(to: targetPoints.last!, controlPoint1: controlPoint1, controlPoint2: controlPoint2)

            let newLineLayer = CAShapeLayer()
            newLineLayer.path = linePath.cgPath
            
            newLineLayer.strokeColor = selectedColor
            newLineLayer.fillColor = UIColor.clear.cgColor

            newLineLayer.lineWidth = 5
            
      
            mainView.layer.addSublayer(newLineLayer)
            
    
            self.lineLayer.append(newLineLayer)
        
    }



}




extension UIButton {
    func applyBorderWithColor(_ colorName: String) {
        self.layer.cornerRadius = 10
        if let borderColor = UIColor(named: colorName) {
            self.layer.borderWidth = 5.0
            self.layer.borderColor = borderColor.cgColor
        }
    }
}


struct MatchQuizUikit:UIViewControllerRepresentable
{
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "matchview") as! MatchQuizController
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        //
    }
    
    typealias UIViewControllerType = UIViewController
    
    
    
    
}
