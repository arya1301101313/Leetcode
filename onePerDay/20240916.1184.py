"""
https://leetcode.cn/problems/distance-between-bus-stops/description/?envType=daily-question&envId=2024-09-16
"""

class Solution:
    def distanceBetweenBusStops(self, distance: list[int], start: int, destination: int) -> int:
        clockwise=0
        counterClockwise=0
        if destination>start:
            for i in range(start,destination,1):
                clockwise+=distance[i]
            for i in range(destination-len(distance),start,1):
                counterClockwise+=distance[i]
        else:
            for i in range(start,len(distance),1):
                clockwise+=distance[i]
            for i in range(0,destination,1):
                clockwise+=distance[i]
            for i in range(start,destination,-1):
                counterClockwise+=distance[i-1]
        if clockwise<counterClockwise:
            return clockwise
        else:
            return counterClockwise


if __name__ == "__main__":
    solution = Solution()
    # Case1
    distance = [1, 2, 3, 4]
    start = 0
    destination = 1

    result = solution.distanceBetweenBusStops(distance, start, destination)
    print(result)
