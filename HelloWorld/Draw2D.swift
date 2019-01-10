//
// Created by 吴凡 on 2019-01-10.
// Copyright (c) 2019 LOVEGINGER. All rights reserved.
//

import UIKit

class Draw2D: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func draw(_ rect: CGRect) {
    let context = UIGraphicsGetCurrentContext()!
//      drawOneLine(context)
//      drawLines(context)
//      drawRectangle(context)
//      drawEllipse(context)
//      fillPath(context!)
//      drawStrokeAndFillPath(context)
//      drawArc(context)
//      drawCubicBezierCurve(context)
//      drawShadow(context)
//      drawLinearGradients(context)
    drawRadialGradient(context)
  }

  private func drawOneLine(_ context: CGContext) {
    context.setLineWidth(2.0)
    let color: UIColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
    context.setStrokeColor(color.cgColor)
    context.move(to: CGPoint(x: 30, y: 30))
    context.addLine(to: CGPoint(x: 300, y: 400))
    context.strokePath()
  }

  private func drawLines(_ context: CGContext) {
    context.setLineWidth(2.0)
    context.setStrokeColor(UIColor.blue.cgColor)
    context.addLines(between: [CGPoint(x: 100, y: 100),
                               CGPoint(x: 150, y: 150),
                               CGPoint(x: 100, y: 200),
                               CGPoint(x: 50, y: 150),
                               CGPoint(x: 100, y: 100)])
//    context.move(to: CGPoint(x: 100, y: 100))
//    context.addLine(to: CGPoint(x: 150, y: 150))
//    context.addLine(to: CGPoint(x: 100, y: 200))
//    context.addLine(to: CGPoint(x: 50, y: 150))
//    context.addLine(to: CGPoint(x: 100, y: 100))
    context.strokePath()
  }

  private func drawRectangle(_ context: CGContext) {
    context.setLineWidth(4.0)
    context.setStrokeColor(UIColor.blue.cgColor)
    let rect = CGRect(x: 60, y: 170, width: 200, height: 80)
    context.addRect(rect)
    context.strokePath()
  }

  private func drawEllipse(_ context: CGContext) {
    context.setLineWidth(4.0)
    context.setStrokeColor(UIColor.blue.cgColor)
    let rect = CGRect(x: 60, y: 170, width: 200, height: 80)
    context.addEllipse(in: rect)
    context.strokePath()
  }

  private func fillPath(_ context: CGContext) {
    context.setLineWidth(2.0)
    context.addLines(between: [CGPoint(x: 100, y: 100),
                               CGPoint(x: 150, y: 150),
                               CGPoint(x: 100, y: 200),
                               CGPoint(x: 50, y: 150),
                               CGPoint(x: 100, y: 100)])
    context.setFillColor(UIColor.red.cgColor)
    context.fillPath()
  }

  private func drawStrokeAndFillPath(_ context: CGContext) {
    context.setLineWidth(4.0)
    context.setStrokeColor(UIColor.blue.cgColor)
    let rect = CGRect(x: 60, y: 170, width: 200, height: 80)
    context.addRect(rect)
    context.strokePath()
    context.setFillColor(UIColor.red.cgColor)
    context.fill(rect)
  }

  private func drawArc(_ context: CGContext) {
    context.setLineWidth(4.0)
    context.setStrokeColor(UIColor.blue.cgColor)
    context.addArc(center: CGPoint(x: 100, y: 100),
        radius: 50.0, startAngle: 0, endAngle: CGFloat(Double.pi / 2), clockwise: false)
    context.strokePath()
  }

  private func drawCubicBezierCurve(_ context: CGContext) {
    context.setLineWidth(4.0)
    context.setStrokeColor(UIColor.blue.cgColor)
    context.move(to: CGPoint(x: 10, y: 10))
    context.addCurve(to: CGPoint(x: 300, y: 400),
        control1: CGPoint(x: 0, y: 50),
        control2: CGPoint(x: 300, y: 250))
    context.strokePath()
  }

  private func drawShadow(_ context: CGContext) {
    let shadowOffset = CGSize(width: -10, height: 15)
    context.saveGState()
    context.setShadow(offset: shadowOffset, blur: 5)
    context.setLineWidth(4.0)
    context.setStrokeColor(UIColor.blue.cgColor)
    context.addEllipse(in: CGRect(x: 60, y: 170, width: 200, height: 80))
    context.strokePath()
    context.restoreGState()
  }

  private func drawLinearGradients(_ context: CGContext) {
    let colors = [UIColor.red.cgColor, UIColor.green.cgColor,
                  UIColor.blue.cgColor, UIColor.yellow.cgColor] as CFArray
    let gradient: CGGradient = CGGradient(
        colorsSpace: CGColorSpaceCreateDeviceRGB(),
        colors: colors,
        locations: [0.0, 0.25, 0.5, 0.75])!
    context.drawLinearGradient(
        gradient,
        start: CGPoint(x: 0, y: 0),
        end: CGPoint(x: 500, y: 500),
        options: CGGradientDrawingOptions.drawsBeforeStartLocation)
  }

  private func drawRadialGradient(_ context: CGContext) {
    let colors = [UIColor.red.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor] as CFArray
    let gradient = CGGradient(
        colorsSpace: CGColorSpaceCreateDeviceRGB(),
        colors: colors,
        locations: [0.0, 0.5, 1.0])!
    context.drawRadialGradient(
        gradient,
        startCenter: CGPoint(x: 100, y: 100),
        startRadius: 10,
        endCenter: CGPoint(x: 200, y: 200),
        endRadius: 75,
        options: CGGradientDrawingOptions.drawsBeforeStartLocation)
  }

}
