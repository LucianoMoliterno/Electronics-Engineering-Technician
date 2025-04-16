// Initialize the game
let currentPlayer = "X";
let cells = Array.from(document.getElementsByClassName("cell"));

// Add event listeners to each cell
cells.forEach((cell) => {
    cell.addEventListener("click", makeMove);
});

// Make a move
function makeMove(index) {
    if (cells[index].innerText === "") {
        cells[index].innerText = currentPlayer;
        cells[index].classList.add(currentPlayer.toLowerCase());

        if (checkWin(currentPlayer)) {
            setTimeout(() => {
                alert(currentPlayer + " wins!");
                resetGame();
            }, 100);
        } else if (checkDraw()) {
            setTimeout(() => {
                alert("It's a draw!");
                resetGame();
            }, 100);
        } else {
            currentPlayer = currentPlayer === "X" ? "O" : "X";
        }
    }
}
// Check for a win
function checkWin(player) {
    const winningCombos = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ];

    return winningCombos.some((combo) => {
        return combo.every((index) => {
            return cells[index].innerText === player;
        });
    });
}


// Check for a draw
function checkDraw() {
    return cells.every((cell) => {
        return cell.innerText !== "";
    });
}

// Reset the game
function resetGame() {
    currentPlayer = "X";
    cells.forEach((cell) => {
        cell.innerText = "";
        cell.classList.remove("red", "blue");
    });
}