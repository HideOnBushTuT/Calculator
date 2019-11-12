//
//  ContentView.swift
//  Calculator
//
//  Created by CBReno on 2019/11/11.
//  Copyright © 2019 CBReno. All rights reserved.
//
import SwiftUI

struct CalculatorButton: View {
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
            .font(.system(size: fontSize))
            .foregroundColor(.white)
                .frame(width: size.width, height: size.height)
            .background(Color(backgroundColorName))
            .cornerRadius(44)
        }
    }
}

struct CalculatorButtonRow: View {
    let row: [CalculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { (item) in
                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName) {
                print("Button: \(item.title)")
                }
            }
        }
    }
}

struct CalculatorPad: View {
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.multiply)],
        [.digit(0), .dot, .op(.equal)]
    ]
    
    var body: some View {
        VStack(spacing: 8) {
                    ForEach(pad, id: \.self) { row in
                        CalculatorButtonRow(row: row)
            }
        }
    }
}

struct ContentView: View {
//    let row: [CalculatorButtonItem] = [.digit(1), .digit(2), .digit(3), .op(.plus)]
    let scale: CGFloat = UIScreen.main.bounds.width / 414
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("0234567890")
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       alignment: .trailing)
            CalculatorPad()
                .padding(.bottom)
        }
    .scaleEffect(scale)
//        VStack(spacing: 8) {
//                    ForEach(pad, id: \.self) { row in
//                        CalculatorButtonRow(row: row)
//                    }
        //            CalculatorButtonRow(row: [.command(.clear), .command(.flip), .command(.percent), .op(.divide)])
        //            CalculatorButtonRow(row: [.digit(7), .digit(8), .digit(9), .op(.multiply)])
        //            CalculatorButtonRow(row: [.digit(4), .digit(5), .digit(6), .op(.minus)])
        //            CalculatorButtonRow(row: [.digit(1), .digit(2), .digit(3), .op(.plus)])
        //            CalculatorButtonRow(row: [.digit(0), .dot, .op(.equal)])
//                }
    }
        
        
//        HStack {
//            ForEach(row, id: \.self) { (item) in
//                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName) {
//                    print("Button: \(item.title)")
//                }
//            }
//            CalculatorButton(title: "1", size: CGSize(width: 88, height: 88), backgroundColorName: "digitBackground") {
//                print("Button: 1")
//            }
//            CalculatorButton(title: "2", size: CGSize(width: 88, height: 88), backgroundColorName: "digitBackground") {
//                print("Button: 2")
//            }
//            CalculatorButton(title: "3", size: CGSize(width: 88, height: 88), backgroundColorName: "digitBackground") {
//                print("Button: 3")
//            }
//            CalculatorButton(title: "+", size: CGSize(width: 88, height: 88), backgroundColorName: "digitBackground") {
//                print("Button: +")
//            }
//        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
