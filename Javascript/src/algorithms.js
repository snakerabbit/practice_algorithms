(function () {
if(typeof Algorithms === "undefined") {
  window.Algorithms = {};
}

// Write a method, digital_root(num).
// It should sum the digits of a positive integer.
// If it is greater than or equal to 10, sum the digits of the resulting number.
// Keep repeating until there is only one digit in the result, called the "digital root".
// Do not use string conversion within your method.
Algorithms.digitalRoot = function (number) {//123
  if(number < 10){
    return number;
  } else {
    return this.digitalRoot(this.digitalRoot(number % 10) + this.digitalRoot(Math.floor(number / 10)));
  }

};

// Write a function that takes a message and an increment amount and outputs the same letters shifted by that amount in the alphabet.
// Assume lowercase and no punctuation.
// Preserve spaces.
Algorithms.caesarCipher = function (string, shift) {
  let alpha ="abcdefghijklmnopqrstuvwxyz".split("");
  let newString = "";
  string.split("").forEach(letter =>{
    let newIdx = (alpha.indexOf(letter) + shift)%26;
    newString += alpha[newIdx];
  });
  return newString;
};

// Write a function that takes two strings and returns the lenght of the longest common substring.
Algorithms.commonSubstrings = function (stringOne, stringTwo) {
  let twoDArray = new Array(stringOne.length).fill(new Array(stringTwo.length).fill(0));
  var length = 0;
  var end = null;
  var start = end - length + 1 || 0;
  stringOne.split('').forEach((char1, index1) =>{
    stringTwo.split('').forEach((char2, index2) =>{
      if(char1 === char2){
        twoDArray[index1][index2] = twoDArray[index1-1][index2-1] + 1;
        if (twoDArray[index1][index2] > length){
          length = twoDArray[index1][index2];
          end = index1;
        }
      }
    });
  });

  return stringOne.slice(start, end);

};

// Write a function that takes an array of integers and returns their sum.
// Use recursion.
Algorithms.sumRec = function (numbers) {
  if(numbers.length === 1){
    return numbers[numbers.length - 1];
  }
  let previous = this.sumRec(numbers.slice(0, -1));
  return previous + numbers[numbers.length - 1];
};

// Write a function which returns the first n elements from the fibonnacci sequence, given n.
Algorithms.fibs = function (number) {
  if(number === 1 ){
    return [0];
  }
  if(number === 2) {
    return [0,1];
  }
  let previous = this.fibs(number-1);
  let next = previous[previous.length-2] + previous[previous.length-1];
  return previous.concat([next]);
};

// Write a function that takes a string and returns true if it's a palindrome, false if it's not.
// Your solution should take less time and memory than rebuilding the string backward and comparing the two.
Algorithms.isPalindrome = function (string) {
  let i= 0;
  let j = string.length-1;
  while (i !== j){
    if(string[i]!== string[j]){
      return false;
    }
    i += 1;
    j -=1;
  }
  return true;
};

// Implement the Folding Cipher.
// It folds the alphabet in half and uses the adjacent letter.
// a <=> z, b <=> y, c <=> x, m <=> n.
Algorithms.foldingCipher = function (string) {
  let alphabet = "abcdefghijklmnopqrstuvwxyz"
  let alpha = alphabet.split('');
  let beta = alphabet.split('').reverse();
  let folded = {};
  alpha.forEach((char, idx) =>{
    folded[char] = beta[idx];
  });
  let newString = '';

  string.split('').forEach(char =>{
    newString += folded[char];
  });

  return newString;
};

// Write a method that finds all the unique substrings for a word.
Algorithms.uniqSubs = function (string) {
  var arr = [];
  // var arr = new Set();
  for(let i = 0; i<string.length; i++){
    for(let j = i+1; j<string.length+1 ; j++){
      if(!arr.includes(string.slice(i,j))){
        arr.push(string.slice(i,j));
      //arr.add(string.slice(i,j));
      }
    }
  }

  return arr;
};


// Given an array of integers (positive and negative) find the largest contiguous subsum (sum of a subarray).
// You can solve this trivially in O(n**2) time by considering all subarrays.
// Try to solve it in O(n) time with O(1) memory.
Algorithms.lcs = function (array) {
  
};

// Write a function that takes a year (four digit integer) and returns an array with the 10 closest subsequent years that meet the following condition:
// the first two digits summed with the last two digits are equal to the middle two digits.
Algorithms.sillyYears = function (number) {

};

// Given an array of integers, return all pairs that sum up to a specified value k.
// List the pairs in [min, max] order.
// Time complexity: O(n).
// Return an array.
Algorithms.pairSum = function (array, k) {

};

// Given a matrix of integers and coordinates of a rectangular region within the matrix.
// Find the sum of numbers falling inside the rectangle.
// Time complexity: O(number of rows * number of columns).
Algorithms.matrixRegionSum = function (matrix, topLeftCoords, bottomRightCoords) {

};

})();
