function madLib(word1, word2, word3) {
  return (
    `We shall ${word1.toUpperCase()} the ${word2.toUpperCase()} ${word3.toUpperCase()}.`
  )
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

function fizzBuzz(arr) {
  const result = [];

  array.forEach(element => {
    if ((element % 3 === 0) ^ (element % 5 === 0)) {
      result.push(el);
    }
  });

  return result;
}

function isPrime(num) {
  if (n < 2) { return false }

  for (let i = 2; i < n; i++) {
    if (n % i === 0) {
      return false;
    }
  }

  return true;
}

function sumOfNPrimes(n) {
  let sum = 0;
  let countPrimes = 0;
  let i = 2;

  while (countPrimes < n) {
    if (isPrime(i)) {
      sum += i;
      countPrimes++;
    }
    i++;
  }

  return sum;
}
