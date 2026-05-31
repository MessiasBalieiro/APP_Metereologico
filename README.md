🌤️ Terra Brasilis - App Meteorológico Nacional

O Terra Brasilis é um aplicativo de previsão do tempo desenvolvido em Flutter, focado exclusivamente em cidades do Brasil. Ele combina dados precisos de meteorologia com uma interface moderna, fluida e totalmente adaptável para os modos claro e escuro.

O app utiliza a **BrasilAPI** para busca de dados municipais e meteorológicos, e o **Supabase** como backend para gerenciar o histórico de buscas e as cidades favoritas do usuário.

---

## 🚀 Funcionalidades

* 🔍 **Busca Inteligente:** Barra de pesquisa otimizada para encontrar qualquer cidade no território brasileiro.
* 📊 **Card de Clima Atual:** Exibição em tempo real da condição climática, temperatura atual, mínima, máxima e o índice UV do dia.
* 📈 **Gráfico Semanal:** Gráfico intuitivo mostrando a variação das temperaturas máximas e mínimas previstas para a semana.
* 📅 **Previsão Estendida:** Cards menores com o resumo do clima para os próximos dias da semana.
* 🗺️ **Integração com Mapa:** Visualização interativa da cidade pesquisada diretamente no mapa.
* 📜 **Histórico de Buscas:** Acesso rápido às últimas cidades pesquisadas pelo usuário.
* ⭐ **Cidades Favoritas:** Salve suas cidades mais acessadas para não precisar digitar o nome toda vez.
* 🌙 **Modo Escuro:** Interface totalmente adaptada para o conforto visual em ambientes de baixa luminosidade.

---

## 🛠️ Tecnologias Utilizadas

O projeto foi construído utilizando as seguintes tecnologias e pacotes:

* **[Flutter](https://flutter.dev/):** Framework para desenvolvimento multiplataforma.
* **[BrasilAPI](https://brasilapi.com.br/):** Consumo de dados de previsão do tempo e geolocalização das cidades brasileiras.
* **[Supabase](https://supabase.com/):** Banco de dados e autenticação para salvar o histórico e os favoritos em nuvem.
* **[Fl Chart](https://pub.dev/packages/fl_chart):** Para a renderização dos gráficos de temperatura máxima e mínima.
* **[Flutter Map](https://pub.dev/packages/flutter_map):** Para a exibição do mapa da cidade selecionada.

---

## 📦 Como Executar o Projeto

### Pré-requisitos

Antes de começar, você precisará ter instalado em sua máquina:
* [Git](https://git-scm.com)
* [Flutter SDK](https://docs.flutter.dev/get-started/install) (versão estável mais recente)

### Passos para Configuração

1. **Clonar o repositório:**
   ```bash
   git clone (https://github.com/MessiasBalieiro/APP_Metereologico)
   cd app_metereologico
🌐 **Acesse o app online:** [Clique aqui para testar a versão Web](https://messiasbalieiro.github.io/APP_Metereologico/)
