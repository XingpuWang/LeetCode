def combinationSum(candidates, target, epsilon=0.01, all=False):
    """
    :param epsilon: 误差，默认0.01
    :param all: 是否找到所有可能解，默认False
    """
    size = len(candidates)
    if size == 0:
        return []
    res = []
    # 从小到大排序，方便剪枝
    candidates.sort()

    def dfs(begin, path, remain):
        """
        寻找剩余remain时的所有可能路径
        :param begin: 当前搜索中, 剩余候选数的最小索引
        :param path: 当前搜索记录下来的路径
        :param remain: 当前剩余求和目标大小
        :return: None 不返回值，若路径有效则直接加到外部变量res中去
        """
        if len(res) == 0 or (len(res) > 0 and all == True):
            # 剩余满足阈值，则说明已经找到，将该路径添加到res
            if abs(remain) <= epsilon:
                res.append(path[:])
                return

            for i in range(begin, size):
                # 更新剪枝条件：对于侯选数都是正数，如果候选数大于（剩下的目标+误差），剪枝
                if candidates[i] > (remain+epsilon):
                    break
                # 如果当前候选数和本循环中已经使用过的候选数重合，则跳过
                if i > begin and candidates[i] == candidates[i-1]:
                    continue
                # 若候选数小于等于remain且不与之前数重合，路径中添加该候选数
                path.append(candidates[i])
                # 在余下候选数中寻找所有可能路径
                dfs(i+1, path, remain-candidates[i])
                # 将当前候选数从path中剔除（当前候选数的所有可能已经推演完毕并赋予res），
                # 继续到下一个候选数进行循环
                path.pop()

    dfs(0, [], target)
    return res

def combinationSum2(candidates, target, epsilon=0.01, all=False):
    candidates_new = [abs(item) for item in candidates]
    target_new = abs(target)
    temp_res = combinationSum(candidates_new, target_new, epsilon, all)
    res = [[-i for i in item] for item in temp_res]
    return res