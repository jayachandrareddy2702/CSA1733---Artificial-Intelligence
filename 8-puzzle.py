import heapq

class PuzzleState:
    def __init__(self, board, parent=None, move="", depth=0):
        self.board = board
        self.parent = parent
        self.move = move
        self.depth = depth
        self.cost = self.depth + self.manhattan_distance()

    def manhattan_distance(self):
        """
        Calculate the Manhattan Distance heuristic for the current board.
        """
        distance = 0
        goal = {(0, 0): 1, (0, 1): 2, (0, 2): 3,
                (1, 0): 4, (1, 1): 5, (1, 2): 6,
                (2, 0): 7, (2, 1): 8, (2, 2): 0}

        for r in range(3):
            for c in range(3):
                if self.board[r][c] == 0:
                    continue
                goal_pos = next(pos for pos, val in goal.items() if val == self.board[r][c])
                distance += abs(r - goal_pos[0]) + abs(c - goal_pos[1])
        
        return distance

    def get_neighbors(self):
        """
        Generate all possible moves from the current state.
        """
        def swap(board, pos1, pos2):
            new_board = [row[:] for row in board]
            new_board[pos1[0]][pos1[1]], new_board[pos2[0]][pos2[1]] = new_board[pos2[0]][pos2[1]], new_board[pos1[0]][pos1[1]]
            return new_board

        neighbors = []
        row, col = next((r, c) for r in range(3) for c in range(3) if self.board[r][c] == 0)
        moves = [("U", (row-1, col)), ("D", (row+1, col)), ("L", (row, col-1)), ("R", (row, col+1))]

        for move, (r, c) in moves:
            if 0 <= r < 3 and 0 <= c < 3:
                new_board = swap(self.board, (row, col), (r, c))
                neighbors.append(PuzzleState(new_board, self, move, self.depth + 1))
        
        return neighbors

    def __lt__(self, other):
        return self.cost < other.cost

    def __eq__(self, other):
        return self.board == other.board

    def __hash__(self):
        return hash(str(self.board))

def solve_puzzle(start_board):
    """
    Solve the 8-puzzle using the A* algorithm.
    """
    start_state = PuzzleState(start_board)
    open_set = []
    heapq.heappush(open_set, start_state)
    closed_set = set()

    while open_set:
        current_state = heapq.heappop(open_set)

        if current_state.manhattan_distance() == 0:
            solution_path = []
            state = current_state
            while state.parent is not None:
                solution_path.append(state.move)
                state = state.parent
            return solution_path[::-1]

        closed_set.add(current_state)

        for neighbor in current_state.get_neighbors():
            if neighbor in closed_set:
                continue

            if neighbor not in open_set:
                heapq.heappush(open_set, neighbor)
    
    return None

# Example usage:
initial_board = [
    [1, 0, 2],
    [4, 6, 3],
    [7, 5, 8]
]

solution = solve_puzzle(initial_board)
print("Solution steps:", solution)
