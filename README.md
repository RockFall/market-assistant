# **ShoppingPlanner**

## **1. Membros do Grupo**
- **Caio Henrique Dias Rocha** - Matrícula: 2021421893  
- **Kaique de Oliveira e Silva** - Matrícula: 2021095112  

---

## **2. Sobre o Sistema**
**ShoppingPlanner** é um esboço inicial de um aplicativo de organização de receitas semanais, lista de compras e controle de produtos. O objetivo do sistema é auxiliar usuários no planejamento de suas compras e na otimização do uso de produtos e receitas. 

Este projeto foi desenvolvido como parte do trabalho prático da disciplina **Engenharia de Software 2** na UFMG e inclui as seguintes funcionalidades:
- Exibição de produtos categorizados com suporte a filtros por categoria.
- Navegação intuitiva entre as principais telas: produtos, receitas, plano de receitas, dispensa e perfil.
- Mock de dados para receitas e produtos, permitindo que o sistema seja testado facilmente.
- Estrutura inicial para expansão futura, incluindo a integração de algoritmos de otimização para planejamento de compras e receitas.

---

## **3. Tecnologias Utilizadas**
O projeto foi desenvolvido utilizando as seguintes tecnologias:
- **Flutter**: Framework principal para desenvolvimento do aplicativo multiplataforma (Android, iOS, Web).
- **Dart**: Linguagem de programação utilizada com Flutter.
- **SQLite**: Banco de dados local para armazenar informações de produtos e receitas.
- **Flutter Test**: Framework nativo de testes unitários e de widgets para validação das funcionalidades.
- **Integration Test**: Framework do Flutter para testes de integração que cobrem interações completas do usuário.
- **GitHub Actions**: Ferramenta de integração contínua para automatizar a execução de testes em diferentes sistemas operacionais (Linux, macOS e Windows).

---

## **4. Como Rodar os Testes**
### **Pré-requisitos**
- **Flutter instalado**: Certifique-se de que o Flutter está configurado corretamente em seu ambiente. Execute:
  ```bash
  flutter doctor
  ```

- **Dispositivo ou emulador ativo**: Para testes de integração, é necessário um dispositivo conectado ou um emulador em execução.

### **Testes Unitários e de Widgets**
Para rodar os testes unitários e de widgets, use:
```bash
flutter test
```

### **Testes de Integração**
Para rodar os testes de integração:
1. Certifique-se de que um dispositivo ou emulador está ativo.
2. Execute:
    ```bash
    flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart
    ```

### **GitHub Actions**
Os testes são executados automaticamente em cada push no repositório. Para visualizar os resultados, acesse a aba **Actions** no GitHub.
O pipeline de testes inclui:
- Execução dos testes em sistemas Linux, macOS e Windows.
- Validação de que todas as funcionalidades estão funcionando corretamente.

