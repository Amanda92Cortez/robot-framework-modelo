from mimesis import Generic
from mimesis.locales import Locale
from robot.api.deco import keyword

@keyword("Generate Random User")
def generate_random_user():
    generic = Generic(locale=Locale.PT_BR)

    nome = generic.person.full_name()
    email = generic.person.email(domains=["qa.com", "gmail.com"])
    password = generic.person.password(length=10)

    return {
        'nome': nome,
        'email': email,
        'password': password
    }



# import random
# import string

# def generate_random_user():
#     first_names = ['João', 'Maria', 'Carlos', 'Ana', 'Pedro', 'Camila', 'Amanda', 'Julia', 'Vitoria', 'Bruna', 'Larissa']
#     last_names = ['Silva', 'Oliveira', 'Santos', 'Costa', 'Souza', 'Lima', 'Correa', 'Gomes', 'Ferreira', 'Alves', 'Rocha']

#     # Selecionar nome e sobrenome aleatório
#     first_name = random.choice(first_names)
#     last_name = random.choice(last_names)

#     # Gerar nome completo aleatório
#     nome = f"{first_name} {last_name}"

#     # Gerar e-mail usando o primeiro nome e um número aleatório para evitar repetições
#     email = f"{first_name.lower()}{random.randint(100, 999)}@qa.com"

#     # Gerar senha aleatória (8 caracteres alfanuméricos)
#     password = ''.join(random.choices(string.ascii_letters + string.digits, k=8))

#     return {
#         'nome': nome,
#         'email': email,
#         'password': password
#     }


