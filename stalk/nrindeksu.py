# Lista osób z numerami indeksów
import argparse
osoby = {
    261551: "Natalia Błaszczyk",
    273764: "Kacper Celejewski",
    273740: "Aleksandra Ciborowska",
    273769: "Tomasz Dębski",
    273756: "Kinga Dybeł",
    273779: "Michał Gliszczyński",
    276274: "Julia Lada",
    273750: "Grzegorz Ławniczak",
    273761: "Marta Mączyńska",
    273768: "Aleksandra Michalska",
    273720: "Zuzanna Niwińska",
    273760: "Anastazja Osadnik",
    273728: "Dominik Pawliszewski",
    273753: "Piotr Płuciennik",
    273765: "Filip Podgórski",
    273757: "Martyna Rusek",
    273747: "Mikołaj Siewruk",
    273762: "Miłosz Soja",
    273742: "Zofia Szutka",
    273776: "Anna Tądel",
    273741: "Martyna Wandzel",
    273773: "Łucja Wesołowska",
    273786: "Daria Cichowicz",
    273748: "Stanisław Ewert",
    273759: "Paweł Ges",
    273738: "Michał Grudziński",
    273744: "Patryk Gzik",
    273725: "Jeremi Imiołek",
    273782: "Alicja Janowska",
    273754: "Maciej Klossek",
    273780: "Igor Koniusz",
    273724: "Adam Kosiak",
    273731: "Martyna Krawiec",
    273721: "Rafał Lucinkiewicz",
    273719: "Dominik Pachecki",
    273774: "Juliusz Pawełka",
    273739: "Dariusz Pikul",
    273733: "Julia Poradowska",
    273729: "Igor Pyrczak",
    254436: "Joanna Rosowiecka",
    273746: "Paulina Soroko",
    273758: "Jakub Staszak",
    273722: "Jakub Szymczak",
    273718: "Paweł Zawadka",
    273772: "Daria Ziółkowska",
    273735: "Margareta Zyskowska",
    273775: "Hubert Czaja",
    276770: "Laura Daza Silva",
    276275: "Bartłomiej Engel",
    273778: "Jakub Gluza",
    273726: "Paula Krzykowska",
    275910: "Oleksandr Kurylenko",
    273752: "Paweł Łączyński",
    273781: "Maciej Mionsek",
    268163: "Radosław Natanek",
    273777: "Jan Piechocński",
    273749: "Wiktor Pietryka",
    273784: "Yaroslav Sergievich",
    269242: "Michał Świder",
    273785: "Witold Wandel",
    266251: "Bartosz Adamczyk",
    266244: "Aleksandra Dusza",
    260025: "Julian Jakubiak",
    266302: "Aleksandra Kubiak",
    266223: "Patryk Ociepa",
    266242: "Jan Smolicz",
    266297: "Jan Świątek",
    266226: "Maksymilian Zym"
}

# Pobranie numeru indeksu od użytkownika
def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('idx',type=int,action='store',help='Numer indeksu')
    args = parser.parse_args()
    nr_indeksu = args.idx
    print(nr_indeksu)
    print(f"Osoba o numerze indeksu {nr_indeksu} to {osoby[nr_indeksu]}.")

if __name__ == '__main__':
    main()