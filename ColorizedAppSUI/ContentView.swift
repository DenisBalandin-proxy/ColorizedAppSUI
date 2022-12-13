//
//  ContentView.swift
//  ColorizedAppSUI
//
//  Created by Denis on 2022/12/12.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSlider = Double.random(in: 0...255)
    @State private var greenSlider = Double.random(in: 0...255)
    @State private var yellowSlider = Double.random(in: 0...255)
    
    var body: some View {
        VStack {
            Color(
                red: redSlider / 255,
                green: greenSlider / 255,
                blue: yellowSlider / 255
            )
            .frame(width: 320, height: 170)
            .cornerRadius(30)
            
            SliderView(sliderValue: $redSlider)
            SliderView(sliderValue: $greenSlider)
            SliderView(sliderValue: $yellowSlider)
            
            Spacer()
        }
        .padding()
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button(action: previous) {
                    Image(systemName: "chevron.up")
                }
                    
                Button(action: next) {
                    Image(systemName: "chevron.down")
                }
                
                Spacer()
                
            }
            
        }

    }
    private func previous() {
        
    }
    
    private func next() {
        
    }
    
    private func done() {
        
    }
}

struct SliderView: View {
    
    @State private var alertPresented = false
    
    @Binding var sliderValue: Double
    
    @FocusState private var TFIsFocused: Bool
    
    var body: some View {
        HStack {
            Text("\(lround(sliderValue))")
                .frame(width: 50)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
            
            TextField("255", value: $sliderValue, formatter: NumberFormatter())
                .onChange(of: sliderValue) { value in
                    checkNumber()
                    //sliderValue = Double(value) ?? 0
                }
                .focused($TFIsFocused)
                .alert(isPresented: $alertPresented) {
                    Alert(
                        title: Text("Wrong Data"),
                        dismissButton: .default(Text("Okay"), action: {
                            sliderValue = 1
                            TFIsFocused = false
                        })
                    )
                }
                .keyboardType(.decimalPad)
                .frame(width: 50)
        }
    }
    
    private func checkNumber() {
        if !(0...255).contains(sliderValue) {
            alertPresented.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
