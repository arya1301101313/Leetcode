"""
https://leetcode.cn/problems/bus-routes/description/?envType=daily-question&envId=2024-09-17
"""


class Solution:
    def numBusesToDestination(self, routes: list[list[int]], source: int, target: int) -> int:

        # bus-line-rounte contains bus-stop or not :
        def isContainTarget(route: list[int], stop: int) -> bool:
            for j in route:
                if j == stop:
                    return True
            return False

        # get bus-stop's all bus-line-rountes :
        def getAllRountes(routes: list[list[int]], stop: int) -> list[int]:
            lines = []
            for i in range(len(routes)):
                for j in routes[i]:
                    if j == stop:
                        lines.append(i)
            return lines

        # recursion search from some stop
        def search(routes: list[list[int]], source: int, target: int, stop: int, line_count=0) -> (bool,int) :
            flag=False
            if len(routes) == 0:
                return False,-1
            allStopRountes=getAllRountes(routes, stop)
            allStopRountesOtherStops=[]
            routesCopy = routes.copy()
            for line in allStopRountes:
                routesCopy.remove(routes[line])
                allStopRountesOtherStops += routes[line]
                allStopRountesOtherStops.remove(stop)
            if target in allStopRountesOtherStops:
                return True,line_count
            else:
                for s in allStopRountesOtherStops:
                    print(s)
                    line_count += 1
                    flag,line_count=search(routesCopy, source, target,s,line_count)
                    if flag:
                        break
            print(flag,line_count)
            return flag,line_count


        res = search(routes, source, target, source, 0)[1]
        return res


if __name__ == "__main__":
    solution = Solution()
    # Case1
    routes = [[7, 12], [4, 5, 15], [6], [15, 19], [9, 12, 13]]
    source = 15
    target = 12

    # Case2
    # routes = [[1,2,7],[3,6,7]]
    # source = 1
    # target = 6

    result = solution.numBusesToDestination(routes, source, target)
    print(result)








