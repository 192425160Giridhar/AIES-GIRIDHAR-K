import math

tree = [
    [
        [8, 5],
        [6, 9]
    ],
    [
        [4, 7],
        [2, 1]
    ]
]

def alphabeta(node, depth, alpha, beta, maximizing):

    if depth == 3:
        return node

    if maximizing:
        value = -math.inf

        for child in node:
            value = max(value, alphabeta(child, depth + 1,
                                         alpha, beta, False))
            alpha = max(alpha, value)

            if beta <= alpha:
                break

        return value

    else:
        value = math.inf

        for child in node:
            value = min(value, alphabeta(child, depth + 1,
                                         alpha, beta, True))
            beta = min(beta, value)

            if beta <= alpha:
                break

        return value


result = alphabeta(tree, 0, -math.inf, math.inf, True)

print("Optimal Value:", result)
