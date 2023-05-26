import numpy as np
import random
import time
import bruto

from itertools import combinations

def bruto_force_Py(candidates, target, epsilon=0.01, all=False):
    res = []
    for i in range(1, len(candidates)+1):
        for ls in combinations(candidates, i):
            if len(res) == 0 or (len(res) > 0 and all == True):
                if (sum(ls) >= (target-epsilon)) and (sum(ls) <= (target+epsilon)):
                    res.append(list(ls))
            else:
                break
    return(res)

if __name__ == '__main__':

    src1 = list(np.random.randint(0, 1000000, size=50))
    src2 = list(np.random.randint(0, 100000000, size=50)/100)
    src = src1 + src2
    target = [sum(random.sample(src, i)) for i in range(1, 11)]
    src_data_group = [src]
    tar_data_group = [target]

    # Cython version
    start = time.time()

    expect_data_group = []
    for i in range(0, len(tar_data_group)):
        src = src_data_group[i]
        temp = {}
        for tar in tar_data_group[i]:
            temp[tar] = bruto.bruto_force(src, tar)
        expect_data_group.append(temp)
    # print(expect_data_group)

    end = time.time()
    print('Cython Running time: %s Seconds'%(end-start))

    # Python version
    start = time.time()

    expect_data_group = []
    for i in range(0, len(tar_data_group)):
        src = src_data_group[i]
        temp = {}
        for tar in tar_data_group[i]:
            temp[tar] = bruto_force_Py(src, tar)
        expect_data_group.append(temp)
    # print(expect_data_group)

    end = time.time()
    print('Python Running time: %s Seconds'%(end-start))


