import heapq

graph = {
    'S': [('A', 2), ('B', 5)],
    'A': [('C', 3)],
    'B': [('D', 4)],
    'C': [('G', 2)],
    'D': [('G', 1)],
    'G': []
}

heuristic = {
    'S': 7,
    'A': 5,
    'B': 6,
    'C': 2,
    'D': 1,
    'G': 0
}

def greedy_best_first_search(start, goal):
    priority_queue = []
    heapq.heappush(priority_queue, (heuristic[start], start, [start], 0))

    visited = set()

    while priority_queue:
        h, node, path, cost = heapq.heappop(priority_queue)

        if node == goal:
            print("Goal Reached!")
            print("Path:", " -> ".join(path))
            print("Total Cost:", cost)
            return

        if node in visited:
            continue

        visited.add(node)

        for neighbor, edge_cost in graph[node]:
            if neighbor not in visited:
                heapq.heappush(priority_queue,
                               (heuristic[neighbor],
                                neighbor,
                                path + [neighbor],
                                cost + edge_cost))

    print("No Path Found")

greedy_best_first_search('S', 'G')
