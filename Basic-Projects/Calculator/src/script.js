let calculator = "";

function appendValue(value) {
  calculator += value;
  document.getElementById("result").value = calculator;
}

function appendOperator(operator) {
  if (calculator.length === 0) return;
  const lastChar = calculator[calculator.length - 1];
  if (
    lastChar === "+" ||
    lastChar === "-" ||
    lastChar === "*" ||
    lastChar === "/"
  ) {
    calculator = calculator.slice(0, -1);
  }
  calculator += operator;
  document.getElementById("result").value = calculator;
}

function clearResult() {
  calculator = "";
  document.getElementById("result").value = "";
}

function deleteLast() {
  calculator = calculator.slice(0, -1);
  document.getElementById("result").value = calculator;
}

function calculate() {
  const result = eval(calculator);
  document.getElementById("result").value = result;
  calculator = result.toString();
}
