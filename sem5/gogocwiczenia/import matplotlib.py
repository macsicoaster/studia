import matplotlib.pyplot as plt

x = [3.2, 5.5, 7, 9, 10.5, 12.5]
y = [2, 3.3, 4, 5.1, 6, 6.5]

# wykres
plt.plot(x, y, 'ro-')
plt.xlabel("x [km]")
plt.ylabel("y [s]")
plt.title("Wykres")
plt.show()