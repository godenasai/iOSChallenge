import UIKit

var numbersArray = [Int]()

//Outer function to avoid more parameters in the recursive function
func getSets(target: Int, set_size: Int) -> [[Int]]? {
    
    //Inner recursive function: used inout for solution parameter to make it change it inside the function
    //
    func sum_up_recursive(_ numbers: [Int], _ subSet: [Int], _ set: inout [[Int]]) {
        
        var sum: Int = 0
        //checking if the subset count is more than given set_size as the first thing for better complexity
        //
        guard subSet.count <= set_size else{
            return
        }
        for x in subSet {
            sum += x
        }
        if sum == target && subSet.count == set_size {
            set.append(subSet)
            return
        }
        guard sum < target else {
            return
        }
        for i in stride(from: 0, to: numbers.count, by: 1) {
            var remaining = [Int]()
            for j in stride(from: i + 1, to: numbers.count, by: 1) {
                remaining.append(numbers[j])
            }
            print(remaining)
            var subSet1 = [Int](subSet)
            subSet1.append(numbers[i])
            sum_up_recursive(remaining, subSet1, &set)
        }
    }
    var solutions = [[Int]]()
    sum_up_recursive(numbersArray, [Int](), &solutions)
    return solutions.count > 0 ? solutions : nil
    }

//Intializing variables here
//
func printSetsWith(_ start: Int,_ end: Int,_ target: Int,_ set_size: Int) {
    for i in start...end {
        numbersArray.append(i);
    }
    if let solution = getSets(target: target, set_size: set_size) {
        print(solution )
    }
}

printSetsWith(1, 20, 20, 2)


