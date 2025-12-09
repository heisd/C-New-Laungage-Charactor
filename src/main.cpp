import math;
import greet;

#include <iostream>

int main() {
    std::cout << "=== Math Module ===" << std::endl;
    std::cout << "3 + 5 = " << add(3, 5) << std::endl;
    std::cout << "10 - 4 = " << subtract(10, 4) << std::endl;
    std::cout << "6 * 7 = " << multiply(6, 7) << std::endl;
    
    std::cout << "\n=== Greet Module ===" << std::endl;
    std::cout << greet() << std::endl;
    std::cout << farewell() << std::endl;
    
    return 0;
}