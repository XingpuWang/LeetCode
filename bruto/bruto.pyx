from itertools import combinations

def bruto_force(candidates, target, epsilon=0.01, all=False):
    res = []
    for i in range(1, len(candidates)+1):
        for ls in combinations(candidates, i):
            if len(res) == 0 or (len(res) > 0 and all == True):
                if (sum(ls) >= (target-epsilon)) and (sum(ls) <= (target+epsilon)):
                    res.append(list(ls))
            else:
                break
    return(res)