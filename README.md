# Painel Bolso 💖 — como colocar online

Você vai usar três serviços gratuitos, nesta ordem:
**Supabase** (login + banco de dados) → **GitHub** (guarda o código) → **Netlify** (publica o site).

Arquivos desta pasta: `index.html` (o app), `config.js` (suas chaves), `supabase.sql` (cria o banco), `netlify.toml`.

---

## 1. Supabase (login e dados)

1. Crie conta em supabase.com e clique em **New project**. Dê um nome (ex.: `painel-bolso`), crie uma senha forte para o banco (guarde-a) e escolha a região **South America (São Paulo)**.
2. Quando o projeto terminar de carregar, abra **SQL Editor → New query**, cole todo o conteúdo de `supabase.sql` e clique em **Run**. Deve aparecer "Success".
3. Abra **Project Settings → API** e copie:
   - **Project URL**
   - **anon public key**
4. Abra o arquivo `config.js` e troque os dois textos `COLE_AQUI...` por esses valores (mantenha as aspas).
5. Crie o **seu** usuário: **Authentication → Users → Add user → Create new user**. Digite seu e-mail e uma senha (mínimo 8 caracteres) e marque **Auto Confirm User**.
6. Deixe o app só seu: **Authentication → Sign In / Providers** (ou *Settings*) → desligue **Allow new users to sign up**. Assim ninguém consegue criar conta, mesmo achando o link.

> O app não tem botão "criar conta" de propósito: só quem você cadastrar no passo 5 entra.

## 2. GitHub (guardar o código)

1. Crie conta em github.com e clique em **New repository**. Nome: `painel-bolso`. Marque **Private** (privado) e crie.
2. Na página do repositório vazio, clique em **uploading an existing file**, arraste **todos os arquivos desta pasta** (`index.html`, `config.js`, `supabase.sql`, `netlify.toml`, `README.md`, `.gitignore`) e clique em **Commit changes**.

> É seguro subir o `config.js` com a anon key: ela é feita para ficar no navegador. Seus dados ficam protegidos pelo login e pelas regras do `supabase.sql`. **Nunca** suba a chave `service_role`.

## 3. Netlify (publicar)

1. Crie conta em netlify.com (pode entrar com o GitHub).
2. **Add new site → Import an existing project → GitHub**, autorize e escolha `painel-bolso`.
3. Deixe **Build command** vazio e **Publish directory** como `.` (o `netlify.toml` já informa isso). Clique em **Deploy**.
4. Em ~1 minuto você recebe um endereço como `https://nome-aleatorio.netlify.app`. Você pode trocar o nome em **Site configuration → Change site name**.

## 4. Último ajuste (importante para "esqueci minha senha")

No Supabase: **Authentication → URL Configuration**
- **Site URL**: o endereço do seu site no Netlify (ex.: `https://seu-painel.netlify.app`)
- **Redirect URLs**: adicione o mesmo endereço.

Pronto: abra o endereço, entre com o e-mail e a senha do passo 5.

## No celular

Abra o endereço no Chrome (Android) ou Safari (iPhone) → menu → **Adicionar à tela inicial**. Vira um ícone como se fosse um app.

## Atualizar o app depois

Troque o arquivo no GitHub (**Add file → Upload files**, mesmo nome). O Netlify republica sozinho em segundos.

## Dúvidas comuns

- **"Falta configurar o config.js"**: o passo 1.4 não foi feito ou o arquivo não subiu no GitHub.
- **Entrei e tudo está vazio**: normal, é uma conta nova. Os dados do app de teste do Claude não são copiados; o painel começa em branco.
- **E-mail ou senha incorretos**: confira se marcou *Auto Confirm User* no passo 1.5; senão, use "Esqueci minha senha".
- **Erro ao salvar**: confirme que rodou o `supabase.sql` inteiro e que está logada.
- **Backup**: Supabase → **Table Editor → docs → Export** baixa todos os seus dados em CSV quando quiser.
