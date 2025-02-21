import random

def generate_random_product():
    product_names = ['Smartphone', 'Notebook', 'Tablet', 'Fone de Ouvido', 'Monitor', 'Teclado', 'Mouse', 'Câmera', 'Impressora', 'Headset']
    product_descriptions = [
        'Um dispositivo de alta qualidade para o seu dia a dia.',
        'O melhor produto para aumentar sua produtividade.',
        'Compacto, eficiente e fácil de usar.',
        'Tecnologia de ponta com preço acessível.',
        'Design moderno com desempenho excelente.',
        'Desenvolvido para oferecer conforto e eficiência.',
        'Ideal para quem busca precisão e velocidade.',
        'Capture os melhores momentos com alta definição.',
        'Impressão rápida e de alta qualidade.',
        'Áudio imersivo para uma melhor experiência.'
    ]
    
    # Selecionar nome de produto, descrição e quantidade aleatórios
    product_name = random.choice(product_names)
    product_description = random.choice(product_descriptions)
    product_price = round(random.uniform(50, 5000), 0)  # Gera um preço entre 50 e 5000
    product_quantity = random.randint(1, 100)  # Gera uma quantidade aleatória entre 1 e 100

    return {
        'nome': product_name,
        'preco': product_price,
        'descricao': product_description,
        'quantidade': product_quantity
    }