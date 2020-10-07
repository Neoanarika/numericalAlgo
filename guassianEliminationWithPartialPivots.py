from sympy import Rational

def formated_array_print(arr):
    """
    Formats the array printed out to be more readable 
    """
    m = len(arr)-1
    print('[', end='')
    for i in range(m):
         print(arr[i])
    print(arr[m], end='')
    print(']', end='\n\n')

def guassianElimination(arr, verbose=False, steps=False, backwardSub=False):
    """
    guassianElimination takes a python list and performs guassian elimination

    WARNING 
    -------
    Backward substituion only works if we assume the last column are all b entries

    Inputs
    ------
    arr : python list
    verbose: Boolean, if true it outputs each steps of the guassian elimination
    steps: Boolean, shows the row operations being done on each step
    backwardSub: Boolean, if true it runs backward substitution on the matrix
    """
    # Parameters for the algorithm
    N = len(arr)
    M = len(arr[0])

    # row labels
    r = [i for i in range(N)]

    formated_array_print(arr)
    for k in range(N-1):
        # Elimination of subsequent row
        
        largest = k
        le = abs(arr[0][0])
        for i in range(largest, N):
            val = abs(arr[i][k])
            if le < val:
                le = val
                largest = i 
        if steps and k != largest: print(f'({k+1}) <-> ({largest+1})')
        r[k], r[largest] = r[largest], r[k]

        for i in range(k+1, N):
            m = Rational(arr[r[i]][k],arr[r[k]][k])
            if steps: print(f'({i+1}) <- ({i+1}) - {m} x ({k+1})')
            for j in range(k+1, M):
                arr[r[i]][j] = arr[r[i]][j] - m*arr[r[k]][j]
        if verbose: formated_array_print(arr)
    if not verbose: formated_array_print(arr)

    if backwardSub:
        x = [0]*N
        x[N-1] = arr[r[N-1]][M-1]/arr[r[N-1]][M-2]
        for i in range(N-2, -1, -1):
            x[i] = arr[r[i]][M-1]
            for j in range(M-2, i, -1):
                x[i] = x[i] - arr[r[i]][j]*x[j]
            x[i] = x[i]/arr[r[i]][i]
        print(x)

if __name__ == "__main__":
    # Test array 
    arr1 = [[1, 1, 0, 1, 2],
            [2, 1, -1, 1, 1], 
            [3, -1, -1, 2, -3],
            [-1, 2, 3, -1, 4]]

    arr2 = [[1, 1, -1, 1, -1, -1],
            [3, 1, -3, -2, 3, -6], 
            [2, 2, 1, -1, 1, 7],
            [4, 1, -1, 4, -5, -7],
            [16, -1, 1, 9, -1, 8]]
    
    arr3 = [[2, -3, 2, -4],
            [-4, 2, -6, 4], 
            [2, 2, 1, 8]]

    arr4 = [[1, 3, 5, 7, 4],
            [3, 6, 2, 4, 3], 
            [-2, 3, 1, -1, 1],
            [2, 5, 5, 0, 12]]

    guassianElimination(arr4,
                        verbose = True,
                        steps = True,
                        backwardSub=True) 