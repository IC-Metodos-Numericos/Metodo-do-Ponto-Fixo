import math

def fixed_point_iteration(g, x0, tol=1e-6, max_iter=100):
    """
    Método do Ponto Fixo para encontrar a raiz de f(x) = 0,
    usando uma função g(x) tal que x = g(x).

    :param g: Função g(x) usada para a iteração.
    :param x0: Valor inicial (chute).
    :param tol: Tolerância para o erro.
    :param max_iter: Número máximo de iterações.
    :return: A raiz aproximada, número de iterações e lista de aproximações.
    """
    iter_count = 0
    x = x0
    values = [x0]

    while iter_count < max_iter:
        x_next = g(x)
        values.append(x_next)

        if abs(x_next - x) < tol:
            return x_next, iter_count + 1, values

        x = x_next
        iter_count += 1

    raise Exception("O método não convergiu dentro do número máximo de iterações.")

if __name__ == "__main__":
    g = lambda x: math.sqrt(6-x)
    x0 = 2.25

    try:
        root, iters, history = fixed_point_iteration(g, x0)
        print(f"Raiz aproximada: {root}")
        print(f"Número de iterações: {iters}")
        print("Histórico de aproximações:")
        for i, val in enumerate(history):
            print(f"  Iteração {i}: {val}")
    except Exception as e:
        print(e)
