import math

tree = [
    [
        [3, 5],
        [6, 9]
    ],
    [
        [1, 2],
        [0, -1]
    ]
]

def minimax(node, depth, isMax):

    if depth == 3:
        return node

    if isMax:
        best = -math.inf
        for child in node:
            best = max(best, minimax(child, depth + 1, False))
        return best

    else:
        best = math.inf
        for child in node:
            best = min(best, minimax(child, depth + 1, True))
        return best

result = minimax(tree, 0, True)

print("Optimal Value:", result)
