def solution(N, A):
    length = A.__len__()
    X = [0] * N
    # print(X)
    max = 0
    for i in range(length):
        if 1 <= A[i] <= N:
            # print("i, A[i]: ", i, A[i])
            X[A[i] - 1] += 1
            if X[A[i] - 1] > max:
                max = X[A[i] - 1]
            # print("X: ", X)
        elif A[i] == N + 1:
            # print("i, A[i]: ", i, A[i], "in elif")
            X = [max] * N
            # print("X: ", X)
    return X


N = 5
# A = [1,4,4,4,4,4,3,5,2,2,6]
A = [1,1,1,1,1,1,1, 7,8,9,2,6,4,7,7]
print(solution(N, A))