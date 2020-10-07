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

def guassianElimination(arr, verbose=False, steps=False):
    """
    guassianElimination takes a python list and performs guassian elimination

    Inputs
    ------
    arr : python list
    verbose: Boolean, if true it outputs each steps of the guassian elimination
    steps: Shows the row operations being done on each step
    """
    # Parameters for the algorithm
    N = len(arr)
    M = len(arr[0])

    formated_array_print(arr)
    for k in range(N-1):
        # Elimination of subsequent row
        for i in range(k+1, N):
            m = Rational(arr[i][k],arr[k][k])
            if steps: print(f'({i+1}) <- ({i+1}) - {m} x ({k+1})')
            for j in range(k+1, M):
                arr[i][j] = arr[i][j] - m*arr[k][j]
        if verbose: formated_array_print(arr)
    if not verbose: formated_array_print(arr)

if __name__ == "__main__":
    # Test array 
    arr = [ [1, 1, -1, 1, -1, -1],
            [3, 1, -3, -2, 3, -6], 
            [2, 2, 1, -1, 1, 7],
            [4, 1, -1, 4, -5, -7],
            [16, -1, 1, 9, -1, 8]]

    guassianElimination(arr,
                        verbose = False,
                        steps = False) 