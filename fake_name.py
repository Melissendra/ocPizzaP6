from faker import Faker

fake = Faker('fr_FR')

for _ in range(7):
    print(fake.address())

