import heapq

graph = {
    'S': [('A', 1), ('B', 4)],
    'A': [('C', 2), ('D', 5)],
    'B': [('D', 1)],
    'C': [('G', 5)],
    'D': [('G', 3)],
    'G': []
}

heuristic = {
    'S': 7,
    'A': 6,
    'B': 4,
    'C': 2,
    'D': 1,
    'G': 0
}

def a_star(start, goal):
    priority_queue = []
    heapq.heappush(priority_queue, (heuristic[start], 0, start, [start]))

    visited = set()

    while priority_queue:
        f, g, node, path = heapq.heappop(priority_queue)

        if node == goal:
            print("Optimal Path:", " -> ".join(path))
            print("Actual Cost g(n):", g)
            print("Heuristic h(n):", heuristic[node])
            print("Evaluation f(n):", f)
            return

        if node in visited:
            continue

        visited.add(node)

        for neighbor, cost in graph[node]:
            if neighbor not in visited:
                new_g = g + cost
                new_f = new_g + heuristic[neighbor]
                heapq.heappush(priority_queue,
                               (new_f, new_g, neighbor, path + [neighbor]))

a_star('S', 'G')
