//
//  SKRadioButton.swift
//  UsingRadioButtons
//
//  Created by Kothari, Sagar on 11/9/17.
//  Copyright © 2017 Kothari, Sagar. All rights reserved.
//

import UIKit

@IBDesignable
open class SKRadioButton: UIButton {

  private var iconView: UIView?
  private var iconSecondInnerView: UIView?
  private var iconThirdInnerView: UIView?
  private var textLabel: UILabel?
  private var isChecked: Bool = false

  @IBInspectable public var iconColor: UIColor = UIColor.black
  @IBInspectable public var marginWidth: Double = 10
  @IBInspectable public var iconSize: Double = 30
  @IBInspectable public var titleText: String = "Sagar"

  override open var isSelected: Bool {
    didSet {
      isChecked = isSelected
      super.isSelected = isSelected
    }
  }

  override open func draw(_ rect: CGRect) {
    if iconView == nil {
      let rect = CGRect(x: 0.0, y: self.frame.origin.y/2.0, width: CGFloat(iconSize), height: CGFloat(iconSize))
      iconView = UIView(frame: rect)
      iconView?.clipsToBounds = true
      iconSecondInnerView = UIView(frame: CGRect(x: 0, y: 0, width: iconSize/1.25, height: iconSize/1.25))
      iconSecondInnerView?.clipsToBounds = true
      iconThirdInnerView = UIView(frame: CGRect(x: 0, y: 0, width: iconSize/2.5, height: iconSize/2.5))
      iconThirdInnerView?.clipsToBounds = true
      iconView?.addSubview(iconSecondInnerView!)
      iconView?.addSubview(iconThirdInnerView!)
      self.addSubview(iconView!)
      iconView?.layer.cornerRadius = iconView!.frame.size.width / 2 - 1
      iconSecondInnerView?.layer.cornerRadius = iconSecondInnerView!.frame.size.width / 2 - 1
      iconThirdInnerView?.layer.cornerRadius = iconThirdInnerView!.frame.size.width / 2 - 1
      let x = Double(iconView!.frame.size.width) + marginWidth
      let labelRect = CGRect(x: x, y: 0.0, width: Double(frame.size.width)-x, height: Double(frame.size.height))
      textLabel = UILabel(frame: labelRect)
      self.addSubview(textLabel!)
    }
    iconSecondInnerView?.center = iconView!.center
    iconThirdInnerView?.center = iconSecondInnerView!.center
    iconView?.backgroundColor = iconColor
    iconSecondInnerView?.backgroundColor = UIColor.white
    iconThirdInnerView?.backgroundColor = iconColor
    let iconFrame = CGRect(x: 0.0, y: Double(center.y - iconView!.frame.height/2.0), width: iconSize, height: iconSize)
    iconView?.frame =
    iconThirdInnerView?.isHidden = !isChecked
    let x = Double(iconView!.frame.size.width) + marginWidth
    let rect = CGRect(x: x, y: 0.0, width: Double(frame.size.width)-x, height: Double(frame.size.height))
    textLabel?.frame = rect
    textLabel?.text = titleText
   }

}
