#!/usr/bin/env swift 
import Foundation 

print("enter your name")

var name = readLine(strippingNewline: true)
print("hello \(name ?? "john doe")")

