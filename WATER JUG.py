from collections import deque

CAPACITY = (4, 3)
INITIAL = (0, 0)
GOAL = (2, 0)

def next_states(state):
    x, y = state
    states = []

    # Fill Jug A
    states.append((CAPACITY[0], y))

    # Fill Jug B
    states.append((x, CAPACITY[1]))

    # Empty Jug A
    states.append((0, y))

    # Empty Jug B
    states.append((x, 0))

    # Pour A -> B
    amount = min(x, CAPACITY[1] - y)
    states.append((x - amount, y + amount))

    # Pour B -> A
    amount = min(y, CAPACITY[0] - x)
    states.append((x + amount, y - amount))

    return states

def water_jug():
    queue = deque([(INITIAL, [INITIAL])])
    visited = {INITIAL}

    while queue:
        state, path = queue.popleft()

        if state == GOAL:
            print("Solution Found:\n")
            for step in path:
                print(step)
            return

        for nxt in next_states(state):
            if nxt not in visited:
                visited.add(nxt)
                queue.append((nxt, path + [nxt]))

    print("No Solution")

water_jug()
