from faker import Faker

fake = Faker('fr_FR')

for _ in range(5):
    street= fake.address()
    phone = fake.phone_number()
    mail = fake.email()
    date = fake.date()
    print(f'{date}')

