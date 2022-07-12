//
//  ContentView.swift
//  Unit Player
//
//  Created by Aman Upadhyay on 12/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var conversionType = "Temp"
    @State private var tempUnit = "Celsius"
    @State private var returnTempUnit = "Celsius"
    @State private var lengthUnit = "Meters"
    @State private var returnLengthUnit = "Meters"
    @State private var timeUnit = "Minutes"
    @State private var returnTimeUnit = "Minutes"
    @FocusState private var amountIsfocused : Bool
    
    let conversionTypes = ["Temp", "Lenght", "Time"]
    let tempUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    let lengthUnits = ["Centimeters", "Meters", "Kilometers"]
    let timeUnits = ["Days", "Hours", "Minutes", "Seconds"]
    
    @State private var tempValue = 0.0
    @State private var lenghtValue = 0.0
    @State private var timeValue = 0.0
    
    //__________________________Temp Conversion____________________________
    var celsiusTofahren: Double {
        (tempValue * 9/5) + 32
    }
    var celsiusToKelvin: Double {
        tempValue + 273.15
    }
    var fahrenToCelcius: Double {
        (tempValue - 32) * 5/9
    }
    var fahrenToKelvin: Double {
        fahrenToCelcius + 273.15
    }
    var kelvinToCelsius: Double {
        tempValue - 273.15
    }
    var kelvinToFahren: Double {
        (kelvinToCelsius * 9/5) + 32
    }
    
    //__________________________Lenght Conversion____________________________
    var meterToKilometer: Double {
        lenghtValue / 1000
    }
    var meterToCentimeter: Double {
        lenghtValue * 100
    }
    var kilometerToMeter: Double {
        lenghtValue * 1000
    }
    var kilometerToCenti: Double {
        kilometerToMeter * 100
    }
    var centiToMeter: Double {
        lenghtValue / 100
    }
    var centiToKilometer: Double {
        centiToMeter / 1000
    }
    //__________________________Time Conversion____________________________
    
    var minuteToHour: Double {
        timeValue / 60
    }
    var minuteToSecond: Double {
        timeValue * 60
    }
    var minuteToDays: Double {
        timeValue / 1440
    }
    var hourToSecond: Double {
        hourToMinute * 60
    }
    var hourToMinute: Double {
        timeValue * 60
    }
    var hourToDay: Double {
        hourToMinute / 1440
    }
    var secondToMinute: Double {
        timeValue / 60
    }
    var secondToHour: Double {
        secondToMinute / 60
    }
    var secondToDay: Double {
        secondToMinute / 1440
    }
    var dayToMinute: Double {
        timeValue * 1440
    }
    var dayToHour: Double {
        dayToMinute / 60
    }
    var dayToSecond: Double {
        dayToMinute * 60
    }
    
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker ("Convertion Type", selection: $conversionType) {
                        ForEach(conversionTypes, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Select Conversion type")
                }
                Section {
                    if conversionType == "Temp" {
                        Picker ("Unit Type", selection: $tempUnit){
                            ForEach(tempUnits, id: \.self){
                                Text($0)
                            }
                        }
                        TextField ("Enter Value", value: $tempValue, format: .number)
                            .keyboardType(.decimalPad)
                        
                    } else if conversionType == "Lenght" {
                        Picker ("Unit Type", selection: $lengthUnit){
                            ForEach(lengthUnits, id: \.self){
                                Text($0)
                            }
                        }
                        TextField ("Enter Value", value: $lenghtValue, format: .number)
                            .keyboardType(.decimalPad)
                    } else if conversionType.contains("Time"){
                        Picker ("Unit Type", selection: $timeUnit){
                            ForEach(timeUnits, id: \.self){
                                Text($0)
                            }
                        }
                        TextField ("Enter Value", value: $timeValue, format: .number)
                            .keyboardType(.numberPad)
                    }
                }
                Section {
                    if conversionType.contains("Temp") {
                        Picker ("Return Unit Type", selection: $returnTempUnit){
                            ForEach(tempUnits, id: \.self){
                                Text($0)
                            }
                        }
                        if tempUnit == "Celsius" {
                            switch returnTempUnit {
                            case "Fahrenheit":
                                Text("\(celsiusTofahren.formatted()) °F")
                            case "Kelvin":
                                Text("\(celsiusToKelvin.formatted()) °K")
                            default:
                                Text("\(tempValue.formatted()) °C")
                            }
                        } else if tempUnit == "Fahrenheit" {
                            switch returnTempUnit {
                            case "Celcius":
                                Text("\(fahrenToCelcius.formatted()) °C")
                            case "Kelvin":
                                Text("\(fahrenToKelvin.formatted()) °K")
                            default:
                                Text("\(fahrenToCelcius.formatted()) °F")
                            }
                        } else if tempUnit == "Kelvin" {
                            switch returnTempUnit {
                            case "Fahreheit":
                                Text("\(kelvinToFahren.formatted()) °F")
                            case "Celsius":
                                Text("\(kelvinToCelsius.formatted()) °C")
                            default:
                                Text("\(celsiusToKelvin.formatted()) °K")
                            }
                        }
                        
                    } else if conversionType.contains("Lenght"){
                        Picker ("Return Unit Type", selection: $returnLengthUnit){
                            ForEach(lengthUnits, id: \.self){
                                Text($0)
                            }
                        }
                        if lengthUnit == "Meters" {
                            switch returnLengthUnit {
                            case "Kilometers":
                                Text("\(meterToKilometer.formatted()) km")
                            case "Centimeters":
                                Text("\(meterToCentimeter.formatted()) cm")
                            default:
                                Text("\(lenghtValue.formatted()) m")
                            }
                        } else if lengthUnit == "Kilometers" {
                            switch returnLengthUnit {
                            case "Meters":
                                Text("\(kilometerToMeter.formatted()) m")
                            case "Centimeters":
                                Text("\(kilometerToCenti.formatted()) cm")
                            default:
                                Text("\(meterToKilometer.formatted()) km")
                            }
                        } else if lengthUnit == "Centimeters" {
                            switch returnLengthUnit {
                            case "Kilometers":
                                Text("\(centiToKilometer.formatted()) km")
                            case "Meters":
                                Text("\(centiToMeter.formatted()) m")
                            default:
                                Text("\(meterToCentimeter.formatted()) cm")
                            }
                        }
                        
                    } else if conversionType.contains("Time"){
                        Picker ("Return Unit Type", selection: $returnTimeUnit){
                            ForEach(timeUnits, id: \.self){
                                Text($0)
                            }
                        }
                        if timeUnit == "Minutes" {
                            switch returnTimeUnit {
                            case "Hours":
                                Text("\(minuteToHour.formatted()) hr")
                            case "Seconds":
                                Text("\(minuteToSecond.formatted()) sec")
                            case "Days":
                                Text("\(minuteToDays.formatted()) D")
                            default:
                                Text("\(timeValue.formatted()) min")
                            }
                        } else if timeUnit == "Hours" {
                            switch returnTimeUnit {
                            case "Minutes":
                                Text("\(hourToMinute.formatted()) min")
                            case "Seconds":
                                Text("\(hourToSecond.formatted()) sec")
                            case "Days":
                                Text("\(hourToDay.formatted()) D")
                            default:
                                Text("\(minuteToHour.formatted()) hr")
                            }
                        } else if timeUnit == "Seconds" {
                            switch returnTimeUnit {
                            case "Hours":
                                Text("\(secondToHour.formatted()) hr")
                            case "Minutes":
                                Text("\(secondToMinute.formatted()) min")
                            case "Days":
                                Text("\(secondToDay.formatted()) D")
                            default:
                                Text("\(minuteToSecond.formatted()) sec")
                            }
                        } else if timeUnit == "Days" {
                            switch returnTimeUnit {
                            case "Hours":
                                Text("\(dayToHour.formatted()) hr")
                            case "Seconds":
                                Text("\(dayToSecond.formatted()) sec")
                            case "Minutes":
                                Text("\(dayToMinute.formatted()) min")
                            default:
                                Text("\(minuteToDays.formatted()) D")
                            }
                        }
                        
                    }
                }
            }
            .navigationTitle("Unit Player")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done"){
                        amountIsfocused = false
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
