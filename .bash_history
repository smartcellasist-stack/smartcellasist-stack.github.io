ls
cd
clear
ls
exit
019df670-f36d-7599-8889-916aae39769d
0xf97c04ccf6efb4438011fe1f1429a989f937667f
curl --request POST   --url https://relayer-v2.polymarket.com/submit   --header 'Content-Type: application/json'   --data '
{
  "from": "0x6e0c80c90ea6c15917308F820Eac91Ce2724B5b5",
  "to": "0xC011a7E12a19f7B1f670d46F03B03f3342E82DFB",
  "proxyWallet": "0x6d8c4e9aDF5748Af82Dabe2C6225207770d6B4fa",
  "data": "0x...",
  "nonce": "60",
  "signature": "0x01a060c734d7bdf4adde50c4a7e574036b1f8b12890911bdd1c1cfdcd77502381b89fa8a47c36f62a0b9f1cdfee7b260fd8108536db9f6b2089c02637e7de9fc20",
  "signatureParams": {
    "gasPrice": "0",
    "operation": "0",
    "safeTxnGas": "0",
    "baseGas": "0",
    "gasToken": "0x0000000000000000000000000000000000000000",
    "refundReceiver": "0x0000000000000000000000000000000000000000"
  },
  "type": "SAFE"
}
'
u
curl --request POST   --url https://relayer-v2.polymarket.com/submit   --header 'Content-Type: application/json'   --data '
{
  "from": "0x6e0c80c90ea6c15917308F820Eac91Ce2724B5b5",
  "to": "0xC011a7E12a19f7B1f670d46F03B03f3342E82DFB",
  "proxyWallet": "0x6d8c4e9aDF5748Af82Dabe2C6225207770d6B4fa",
  "data": "0x...",
  "nonce": "60",
  "signature": "0x01a060c734d7bdf4adde50c4a7e574036b1f8b12890911bdd1c1cfdcd77502381b89fa8a47c36f62a0b9f1cdfee7b260fd8108536db9f6b2089c02637e7de9fc20",
  "signatureParams": {
    "gasPrice": "0",
    "operation": "0",
    "safeTxnGas": "0",
    "baseGas": "0",
    "gasToken": "0x0000000000000000000000000000000000000000",
    "refundReceiver": "0x0000000000000000000000000000000000000000"
  },
  "type": "SAFE"
}
'
'


python3 -c "
with open('bot_polymarket.py', 'w') as f:
    f.write('''import httpx
import time

URL = 'https://polygon-mainnet.g.alchemy.com/v2/Y5wqXz5I1M4AaQaBkc4AX'
CARTEIRA = '0xC5868E56B24957D7A0463A2f3B438E80277346A2'

def checar_movimento():
    payload = {'jsonrpc': '2.0', 'id': 1, 'method': 'eth_blockNumber', 'params': []}
    try:
        with httpx.Client() as client:
            r = client.post(URL, json=payload).json()
            u_bloco = int(r['result'], 16)
            print('\\n[ROTA DIGITAL] Radar Ativo!')
            print(f'Vigiando: ...{CARTEIRA[-6:]}')
            
            contagem = 0
            while True:
                r = client.post(URL, json=payload).json()
                b_atual = int(r['result'], 16)
                
                if b_atual > u_bloco:
                    p_bloco = {'jsonrpc': '2.0', 'id': 1, 'method': 'eth_getBlockByNumber', 'params': [hex(b_atual), True]}
                    dados = client.post(URL, json=p_bloco).json()
                    for tx in dados['result']['transactions']:
                        if tx['from'] and tx['from'].lower() == CARTEIRA.lower():
                            print(f'\\n!!! MOVIMENTACAO !!!\\nHash: {tx[\"hash\"]}')
                    u_bloco = b_atual
                
                contagem += 1
                if contagem >= 12: # Avisa que está vivo a cada ~1 minuto
                    print(' > Radar Online (buscando...)')
                    contagem = 0
                time.sleep(5)
    except Exception as e:
        print(f'Erro: {e}')
        time.sleep(10)

if __name__ == '__main__':
    checar_movimento()
''')"
python bot_polymarket.py
-rm bot_polymarket.py
pip install httpx --no-cache-dir
python3 -c "
with open('bot_polymarket.py', 'w') as f:
    f.write('''import httpx, time
URL = 'https://polygon-mainnet.g.alchemy.com/v2/Y5wqXz5I1M4AaQaBkc4AX'
ALVO = '0xC5868E56B24957D7A0463A2f3B438E80277346A2'
def r():
    p = {'jsonrpc':'2.0','id':1,'method':'eth_blockNumber'}
    with httpx.Client() as c:
        u = int(c.post(URL,json=p).json()['result'],16)
        print('\\n[ROTA DIGITAL] Radar Ligado!')
        while True:
            try:
                b = int(c.post(URL,json=p).json()['result'],16)
                if b > u:
                    pb = {'jsonrpc':'2.0','id':1,'method':'eth_getBlockByNumber','params':[hex(b),True]}
                    for tx in c.post(URL,json=pb).json()['result']['transactions']:
                        if tx['from'] and tx['from'].lower() == ALVO.lower():
                            print(f'\\n!!! MOVIMENTACAO !!!\\nHash: {tx[\"hash\"]}')
                    u = b
                time.sleep(5)
            except: time.sleep(10)
if __name__ == '__main__': r()''')"
python bot_polymarket.py
rm bot_polymarket.py
nano bot_polymarket.py
python bot_polymarket.py
echo "# Youtube-ads" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/smartcellasist-stack/Youtube-ads.git
git push -u origin main
git remote add origin https://github.com/smartcellasist-stack/Youtube-ads.git
git branch -M main
git push -u origin main
git remote set-url origin https://smartcellasist-stack:     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 @github.com/smartcellasist-stack/Youtube-ads.git && git push -u origin main
git remote set-url origin https://smartcellasist-stack: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@github.com/smartcellasist-stack/Youtube-ads.git && git push -u origin main
git remote set-url origin https://smartcellasist-stack7haK7NCULffHx6lDCLy6Uwvi3o3H4f1RQcz3@github.com/smartcellasist-stack/Youtube-ads.git && git push -u origin main
git remote set-url origin https://smartcellasist-stack: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@github.com/smartcellasist-stack/Youtube-ads.git && git push -f origin main
git remote set-url origin https://smartcellasist-stack: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@github.com/smartcellasist-stack/Youtube-ads.git && git push -f origin main
git remote set-url origin https://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@github.com/smartcellasist-stack/Youtube-ads.git && git push -f origin main
git remote set-url origin https://smartcellasist-stack:git remote set-url origin https://smartcellasist-stack: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@github.com/smartcellasist-stack/Youtube-ads.git && git push -f origin main
@github.com/smartcellasist-stack/Youtube-ads.git && git push -f origin main
cd ~ && git clone https://github.com/smartcellasist-stack/Youtube-ads.git 2>/dev/null || true && cd Youtube-ads && git pull origin main && git commit --allow-empty -m "Force deploy - trigger Pages" && git push origin main
cd ~/Youtube-ads && cat index.html | head -50
head -5 index.html
[200~cat .github/workflows/static.yml~
cat.github/workflows/static.
cat .github/workflows/static.yml
mkdir -p .github/workflows
cat > .github/workflows/static.yml << 'EOF'
name: Deploy static content to Pages
on:
  push:
    branches: ["main"]
  workflow_dispatch:
permissions:
  contents: read
  pages: write
  id-token: write
jobs:
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Setup Pages
        uses: actions/configure-pages@v5
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: '.'
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
EOF

git add .github
git commit -m "Restore workflow"
git push origin main
git push origin main@github.com/smartcellasist-stack/Youtube-ads.git
git push origin main
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
ls
git remote set-url origin https://smartcellasist-stack:TOKEN_AQUI@github.com/smartcellasist-stack/Youtube-ads.git
git push origin main
ls -la
git remote set-url origin https://smartcellasist-stack:TOKENAQUI@github.com/smartcellasist-stack/Youtube-ads.git
git remote set-url origin https://smartcellasist-stack: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@github.com/smartcellasist-stack/Youtube-ads.git
git remote set-url origin https://smartcellasist-stack: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@github.com/smartcellasist-stack/Youtube-ads.git && git push origin main
git remote set-url origin https://smartcellasist-stack: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@github.com/smartcellasist-stack/Youtube-ads.git && git push origin main
sed -i 's|</head>|<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-4449225172308722" crossorigin="anonymous"></script>\n</head>|' ~/Youtube-ads/index.html
cd ~/Youtube-ads && git add index.html && git commit -m "Add AdSense" && git push origin main
git add index.html
git commit -m "Deploy: Validacao AdSense"
git push origin main
git clone https://github.com/smartcellasist-stack/smartcellasist-stack.github.io
git commit -m "Novo site SmartPhone Brasil"
git push origin main
git clone https://github.com/smartcellasist-stack/smartcellasist-stack.github.io
ls
cd smartcellasist-stack.github.io
git remote set-url origin https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@github.com/smartcellasist-stack/smartcellasist-stack.github.io.git
git clone https://ghp_EBgn3UR3TeFH4eI3S6djrsLavZIGXO1YprPq@github.com/smartcellasist-stack/smartcellasist-stack.github.io.git
ls
git config --global credential.helper store
git clone https://smartcellasist-stack:ghp_EBgn3UR3TeFH4eI3S6djrsLavZIGXO1YprPq@github.com/smartcellasist-stack/smartcellasist-stack.github.io.git
git clone https://smartcellasist-stack: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@github.com/smartcellasist-stack/smartcellasist-stack.github.io.git
cd smartcellasist-stack.github.io
ls
curl -o index.html https://smartcellasist-stack.github.io/index.html
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="pt-BR">
<head><meta charset="UTF-8"><title>SmartPhone Brasil</title></head>
<body><h1>Em breve...</h1></body>
</html>
EOF

git add .
git commit -m "Novo site SmartPhone Brasil"
git push origin main
rm index.html
cat > index.html << 'HTMLEOF'
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="SmartPhone Brasil — Os melhores iPhones e smartphones com os melhores preços da Amazon.">
<title>SmartPhone Brasil — iPhones com Melhores Preços</title>
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@300;400;500;600;700&family=Playfair+Display:wght@700;900&display=swap" rel="stylesheet">
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-4449225172308722" crossorigin="anonymous"></script>
<style>
*{box-sizing:border-box;margin:0;padding:0}
body{font-family:'DM Sans',sans-serif;background:#fff;color:#111;line-height:1.6}
nav{position:sticky;top:0;z-index:100;background:rgba(255,255,255,0.95);backdrop-filter:blur(12px);border-bottom:1px solid #e0e0dc;padding:0 24px;display:flex;align-items:center;justify-content:space-between;height:64px}
.logo{font-family:'Playfair Display',serif;font-size:20px;font-weight:900;color:#111;text-decoration:none}
.logo span{color:#FF6B00}
.nav-links{display:flex;gap:24px;list-style:none}
.nav-links a{text-decoration:none;color:#555;font-size:14px;font-weight:500}
.nav-cta{background:#FF9900;color:white!important;padding:8px 18px;border-radius:6px;font-weight:700!important}
.hero{background:linear-gradient(135deg,#fff 0%,#fff8f3 50%,#fff 100%);padding:80px 24px 60px;text-align:center}
.hero-badge{display:inline-block;background:#FFF0E6;color:#FF6B00;font-size:12px;font-weight:700;letter-spacing:1.5px;text-transform:uppercase;padding:6px 16px;border-radius:100px;margin-bottom:20px}
h1{font-family:'Playfair Display',serif;font-size:clamp(36px,6vw,64px);font-weight:900;line-height:1.1;margin-bottom:20px}
h1 em{font-style:italic;color:#FF6B00}
.hero p{font-size:17px;color:#555;max-width:500px;margin:0 auto 36px}
.hero-btns{display:flex;gap:12px;justify-content:center;flex-wrap:wrap}
.btn-primary{background:#FF9900;color:white;text-decoration:none;padding:14px 28px;border-radius:8px;font-weight:700;font-size:15px}
.btn-secondary{background:#f0f0ee;color:#111;text-decoration:none;padding:14px 28px;border-radius:8px;font-weight:600;font-size:15px;border:1px solid #e0e0dc}
section{padding:60px 24px}
.container{max-width:1100px;margin:0 auto}
.section-header{display:flex;align-items:baseline;justify-content:space-between;margin-bottom:36px}
.section-title{font-family:'Playfair Display',serif;font-size:clamp(24px,4vw,36px);font-weight:900}
.section-link{color:#FF6B00;text-decoration:none;font-size:14px;font-weight:600}
.products-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(240px,1fr));gap:20px}
.product-card{background:#fff;border:1px solid #e0e0dc;border-radius:16px;overflow:hidden;position:relative;transition:box-shadow 0.3s,transform 0.3s}
.product-card:hover{box-shadow:0 12px 40px rgba(0,0,0,0.1);transform:translateY(-4px)}
.product-badge{position:absolute;top:12px;left:12px;background:#FF6B00;color:white;font-size:11px;font-weight:700;padding:4px 10px;border-radius:100px;z-index:2}
.product-img-placeholder{width:100%;height:200px;background:#f8f8f6;display:flex;align-items:center;justify-content:center;font-size:64px}
.product-info{padding:16px}
.product-brand{font-size:11px;font-weight:700;letter-spacing:1px;text-transform:uppercase;color:#888;margin-bottom:4px}
.product-name{font-size:15px;font-weight:600;margin-bottom:8px;line-height:1.3}
.stars{color:#FF9900;font-size:13px}
.rating-count{font-size:12px;color:#888}
.product-price{display:flex;align-items:baseline;gap:8px;margin:10px 0 14px}
.price-current{font-size:22px;font-weight:700}
.price-old{font-size:13px;color:#888;text-decoration:line-through}
.price-discount{font-size:12px;font-weight:700;color:#00A651}
.btn-amazon{display:flex;align-items:center;justify-content:center;gap:8px;background:#FF9900;color:white;text-decoration:none;padding:10px 16px;border-radius:8px;font-weight:700;font-size:14px;width:100%}
.categories-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(160px,1fr));gap:16px}
.category-card{background:#f8f8f6;border:1px solid #e0e0dc;border-radius:12px;padding:24px 16px;text-align:center;text-decoration:none;color:#111}
.category-icon{font-size:36px;margin-bottom:10px}
.category-name{font-size:14px;font-weight:600}
.bg-light{background:#f8f8f6}
.banner-destaque{background:linear-gradient(135deg,#1a1a2e,#0f3460);border-radius:20px;padding:48px;display:flex;align-items:center;justify-content:space-between;gap:32px;flex-wrap:wrap}
.banner-content h2{font-family:'Playfair Display',serif;font-size:clamp(24px,4vw,40px);font-weight:900;color:white;margin-bottom:12px}
.banner-content p{color:rgba(255,255,255,0.7);font-size:16px;margin-bottom:24px}
.banner-emoji{font-size:80px}
.compare-table{width:100%;border-collapse:collapse;font-size:14px}
.compare-table th{background:#f8f8f6;padding:14px 16px;text-align:left;font-weight:700;border-bottom:2px solid #e0e0dc}
.compare-table td{padding:14px 16px;border-bottom:1px solid #f0f0ee}
.check{color:#00A651;font-weight:700}
footer{background:#111;color:rgba(255,255,255,0.7);padding:48px 24px 24px}
.footer-grid{max-width:1100px;margin:0 auto;display:grid;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));gap:40px;margin-bottom:40px}
.footer-logo{font-family:'Playfair Display',serif;font-size:22px;font-weight:900;color:white;margin-bottom:12px}
.footer-logo span{color:#FF6B00}
.footer-col h4{color:white;font-size:14px;font-weight:700;margin-bottom:16px}
.footer-col ul{list-style:none}
.footer-col ul li{margin-bottom:10px}
.footer-col ul a{color:rgba(255,255,255,0.6);text-decoration:none;font-size:13px}
.footer-bottom{max-width:1100px;margin:0 auto;padding-top:24px;border-top:1px solid rgba(255,255,255,0.1);display:flex;justify-content:space-between;flex-wrap:wrap;gap:12px;font-size:12px}
.affiliate-note{background:rgba(255,153,0,0.15);border:1px solid rgba(255,153,0,0.3);border-radius:8px;padding:12px 16px;font-size:12px;color:rgba(255,255,255,0.7);max-width:1100px;margin:0 auto 24px}
@media(max-width:600px){.nav-links{display:none}.banner-emoji{display:none}}
</style>
</head>
<body>
<nav>
<a href="#" class="logo">SmartPhone<span>Brasil</span></a>
<ul class="nav-links">
<li><a href="#iphones">iPhones</a></li>
<li><a href="#notebooks">Notebooks</a></li>
<li><a href="#acessorios">Acessórios</a></li>
<li><a href="https://www.amazon.com.br" target="_blank" class="nav-cta">🛒 Ver Amazon</a></li>
</ul>
</nav>
<div class="hero">
<div class="hero-badge">🇧🇷 Guia completo 2026</div>
<h1>Os melhores <em>iPhones</em><br>com o melhor preço</h1>
<p>Reviews honestos e os melhores preços da Amazon para você tomar a decisão certa.</p>
<div class="hero-btns">
<a href="#iphones" class="btn-primary">📱 Ver iPhones</a>
<a href="#comparativo" class="btn-secondary">Comparar modelos</a>
</div>
</div>
<section>
<div class="container">
<div class="section-header"><h2 class="section-title">Categorias</h2></div>
<div class="categories-grid">
<a href="#iphones" class="category-card"><div class="category-icon">📱</div><div class="category-name">iPhones</div></a>
<a href="#notebooks" class="category-card"><div class="category-icon">💻</div><div class="category-name">Notebooks</div></a>
<a href="#acessorios" class="category-card"><div class="category-icon">🎧</div><div class="category-name">Fones</div></a>
<a href="#acessorios" class="category-card"><div class="category-icon">⌚</div><div class="category-name">Smartwatches</div></a>
<a href="#acessorios" class="category-card"><div class="category-icon">🔋</div><div class="category-name">Carregadores</div></a>
<a href="#acessorios" class="category-card"><div class="category-icon">📷</div><div class="category-name">Câmeras</div></a>
</div>
</div>
</section>
<section class="bg-light" id="iphones">
<div class="container">
<div class="section-header"><h2 class="section-title">📱 iPhones em Destaque</h2><a href="https://www.amazon.com.br/s?k=iphone&tag=SEU-TAG-AQUI" target="_blank" class="section-link">Ver todos →</a></div>
<div class="products-grid">
<div class="product-card"><span class="product-badge">🔥 Mais vendido</span><div class="product-img-placeholder">📱</div><div class="product-info"><div class="product-brand">Apple</div><div class="product-name">iPhone 16 128GB — Preto</div><div><span class="stars">★★★★★</span> <span class="rating-count">(2.341)</span></div><div class="product-price"><span class="price-current">R$ 4.999</span><span class="price-old">R$ 5.799</span><span class="price-discount">-14%</span></div><a href="https://www.amazon.com.br/s?k=iphone+16&tag=SEU-TAG-AQUI" target="_blank" class="btn-amazon">🛒 Ver na Amazon</a></div></div>
<div class="product-card"><span class="product-badge" style="background:#00A651">✨ Novo</span><div class="product-img-placeholder">📱</div><div class="product-info"><div class="product-brand">Apple</div><div class="product-name">iPhone 16 Pro 256GB — Titânio</div><div><span class="stars">★★★★★</span> <span class="rating-count">(1.876)</span></div><div class="product-price"><span class="price-current">R$ 7.499</span><span class="price-old">R$ 8.299</span><span class="price-discount">-10%</span></div><a href="https://www.amazon.com.br/s?k=iphone+16+pro&tag=SEU-TAG-AQUI" target="_blank" class="btn-amazon">🛒 Ver na Amazon</a></div></div>
<div class="product-card"><div class="product-img-placeholder">📱</div><div class="product-info"><div class="product-brand">Apple</div><div class="product-name">iPhone 15 128GB — Rosa</div><div><span class="stars">★★★★☆</span> <span class="rating-count">(4.102)</span></div><div class="product-price"><span class="price-current">R$ 3.799</span><span class="price-old">R$ 4.499</span><span class="price-discount">-16%</span></div><a href="https://www.amazon.com.br/s?k=iphone+15&tag=SEU-TAG-AQUI" target="_blank" class="btn-amazon">🛒 Ver na Amazon</a></div></div>
<div class="product-card"><span class="product-badge" style="background:#6B46C1">💰 Custo-benefício</span><div class="product-img-placeholder">📱</div><div class="product-info"><div class="product-brand">Apple</div><div class="product-name">iPhone 14 128GB — Azul</div><div><span class="stars">★★★★☆</span> <span class="rating-count">(6.540)</span></div><div class="product-price"><span class="price-current">R$ 2.999</span><span class="price-old">R$ 3.799</span><span class="price-discount">-21%</span></div><a href="https://www.amazon.com.br/s?k=iphone+14&tag=SEU-TAG-AQUI" target="_blank" class="btn-amazon">🛒 Ver na Amazon</a></div></div>
</div>
</div>
</section>
<section id="notebooks">
<div class="container">
<div class="section-header"><h2 class="section-title">💻 Notebooks</h2><a href="https://www.amazon.com.br/s?k=notebook&tag=SEU-TAG-AQUI" target="_blank" class="section-link">Ver todos →</a></div>
<div class="products-grid">
<div class="product-card"><span class="product-badge">🔥 Top vendas</span><div class="product-img-placeholder">💻</div><div class="product-info"><div class="product-brand">Apple</div><div class="product-name">MacBook Air M2 — 8GB 256GB</div><div><span class="stars">★★★★★</span> <span class="rating-count">(3.210)</span></div><div class="product-price"><span class="price-current">R$ 8.999</span><span class="price-old">R$ 10.499</span><span class="price-discount">-14%</span></div><a href="https://www.amazon.com.br/s?k=macbook+air+m2&tag=SEU-TAG-AQUI" target="_blank" class="btn-amazon">🛒 Ver na Amazon</a></div></div>
<div class="product-card"><div class="product-img-placeholder">💻</div><div class="product-info"><div class="product-brand">Samsung</div><div class="product-name">Galaxy Book4 — Intel Core i5 8GB</div><div><span class="stars">★★★★☆</span> <span class="rating-count">(987)</span></div><div class="product-price"><span class="price-current">R$ 3.499</span><span class="price-old">R$ 4.199</span><span class="price-discount">-17%</span></div><a href="https://www.amazon.com.br/s?k=samsung+galaxy+book4&tag=SEU-TAG-AQUI" target="_blank" class="btn-amazon">🛒 Ver na Amazon</a></div></div>
<div class="product-card"><span class="product-badge" style="background:#6B46C1">💰 Melhor preço</span><div class="product-img-placeholder">💻</div><div class="product-info"><div class="product-brand">Lenovo</div><div class="product-name">IdeaPad 3i — Intel i5 8GB 512GB</div><div><span class="stars">★★★★☆</span> <span class="rating-count">(2.154)</span></div><div class="product-price"><span class="price-current">R$ 2.799</span><span class="price-old">R$ 3.499</span><span class="price-discount">-20%</span></div><a href="https://www.amazon.com.br/s?k=lenovo+ideapad+3i&tag=SEU-TAG-AQUI" target="_blank" class="btn-amazon">🛒 Ver na Amazon</a></div></div>
</div>
</div>
</section>
<section style="padding:40px 24px">
<div class="container">
<div class="banner-destaque">
<div class="banner-content"><h2>Amazon Prime Day 2026</h2><p>Fique de olho nas maiores ofertas do ano em iPhones, notebooks e acessórios!</p><a href="https://www.amazon.com.br/prime?tag=SEU-TAG-AQUI" target="_blank" class="btn-primary">⚡ Ativar Amazon Prime</a></div>
<div class="banner-emoji">🛍️</div>
</div>
</div>
</section>
<section class="bg-light" id="acessorios">
<div class="container">
<div class="section-header"><h2 class="section-title">🎧 Acessórios</h2><a href="https://www.amazon.com.br/s?k=acessorios+iphone&tag=SEU-TAG-AQUI" target="_blank" class="section-link">Ver todos →</a></div>
<div class="products-grid">
<div class="product-card"><span class="product-badge">🔥 Bestseller</span><div class="product-img-placeholder">🎧</div><div class="product-info"><div class="product-brand">Apple</div><div class="product-name">AirPods Pro (2ª Geração)</div><div><span class="stars">★★★★★</span> <span class="rating-count">(8.432)</span></div><div class="product-price"><span class="price-current">R$ 1.699</span><span class="price-old">R$ 1.999</span><span class="price-discount">-15%</span></div><a href="https://www.amazon.com.br/s?k=airpods+pro&tag=SEU-TAG-AQUI" target="_blank" class="btn-amazon">🛒 Ver na Amazon</a></div></div>
<div class="product-card"><div class="product-img-placeholder">⌚</div><div class="product-info"><div class="product-brand">Apple</div><div class="product-name">Apple Watch Series 10 — 42mm</div><div><span class="stars">★★★★★</span> <span class="rating-count">(1.234)</span></div><div class="product-price"><span class="price-current">R$ 3.299</span><span class="price-old">R$ 3.799</span><span class="price-discount">-13%</span></div><a href="https://www.amazon.com.br/s?k=apple+watch+series+10&tag=SEU-TAG-AQUI" target="_blank" class="btn-amazon">🛒 Ver na Amazon</a></div></div>
<div class="product-card"><div class="product-img-placeholder">🔋</div><div class="product-info"><div class="product-brand">Anker</div><div class="product-name">Carregador MagSafe 20W USB-C</div><div><span class="stars">★★★★☆</span> <span class="rating-count">(3.876)</span></div><div class="product-price"><span class="price-current">R$ 149</span><span class="price-old">R$ 199</span><span class="price-discount">-25%</span></div><a href="https://www.amazon.com.br/s?k=carregador+magsafe&tag=SEU-TAG-AQUI" target="_blank" class="btn-amazon">🛒 Ver na Amazon</a></div></div>
</div>
</div>
</section>
<section id="comparativo">
<div class="container">
<div class="section-header"><h2 class="section-title">⚖️ Comparativo iPhones 2026</h2></div>
<div style="overflow-x:auto">
<table class="compare-table">
<thead><tr><th>Modelo</th><th>Tela</th><th>Câmera</th><th>5G</th><th>Preço aprox.</th></tr></thead>
<tbody>
<tr><td><strong>iPhone 16 Pro</strong></td><td>6.3" ProMotion</td><td>48MP+12MP+12MP</td><td><span class="check">✓</span></td><td><strong>R$ 7.499</strong></td></tr>
<tr><td><strong>iPhone 16</strong></td><td>6.1" OLED</td><td>48MP+12MP</td><td><span class="check">✓</span></td><td><strong>R$ 4.999</strong></td></tr>
<tr><td><strong>iPhone 15</strong></td><td>6.1" OLED</td><td>48MP+12MP</td><td><span class="check">✓</span></td><td><strong>R$ 3.799</strong></td></tr>
<tr><td><strong>iPhone 14</strong></td><td>6.1" OLED</td><td>12MP+12MP</td><td><span class="check">✓</span></td><td><strong>R$ 2.999</strong></td></tr>
</tbody>
</table>
</div>
</div>
</section>
<footer>
<div class="affiliate-note">⚠️ <strong>Aviso de afiliado:</strong> SmartPhone Brasil participa do Programa de Afiliados da Amazon. Ao clicar nos links e realizar uma compra, recebemos uma comissão sem custo adicional para você.</div>
<div class="footer-grid">
<div><div class="footer-logo">SmartPhone<span>Brasil</span></div><p style="font-size:13px">Seu guia completo de tecnologia com reviews honestos e os melhores preços da Amazon.</p></div>
<div class="footer-col"><h4>Categorias</h4><ul><li><a href="#iphones">iPhones</a></li><li><a href="#notebooks">Notebooks</a></li><li><a href="#acessorios">Acessórios</a></li><li><a href="#acessorios">Smartwatches</a></li></ul></div>
<div class="footer-col"><h4>Informações</h4><ul><li><a href="#">Sobre nós</a></li><li><a href="#">Política de privacidade</a></li><li><a href="#">Contato</a></li></ul></div>
</div>
<div class="footer-bottom"><span>© 2026 SmartPhone Brasil. Todos os direitos reservados.</span><span>Feito com ❤️ para quem ama tecnologia</span></div>
</footer>
</body>
</html>
HTMLEF
git add .
git commit -m "Site SmartPhone Brasil completo"
git push origin main

HTMLEOF

git add .
git commit -m "Site SmartPhone Brasil completo"
git push origin main
sed -i 's/SEU-TAG-AQUI/smartamz07-20/g' index.html
git add .
git commit -m "Adiciona ID afiliado Amazon"
git push origin main
cd smartcellasist-stack.github.io
nano index.html
🛒 Ver Amazon
git add .
git commit -m "Adiciona botão Prime Video no menu"
git push origin main
cd
cd ~/smartcellasist-stack.github.io
# Substitua o index.html pelo novo arquivo baixado, depois:
git add .
git commit -m "Adiciona botão Prime Video no menu"
git push origin main
git remote set-url origin https://smartcellasist-stack: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@github.com/smartcellasist-stack/smartcellasist-stack.github.io.git
cp ~/storage/downloads/index.html ~/smartcellasist-stack.github.io/index.html
git add .
git commit -m "Adiciona botão Prime Video no menu"
git push origin main
cp ~/storage/downloads/index.html ~/smartcellasist-stack.github.io/index.html
git add .
git commit -m "Adiciona botão Prime Video no menu"
git push origin main
cp ~/storage/downloads/index.html ~/smartcellasist-stack.github.io/index.html
git add .
git commit -m "Adiciona botão Prime Video no menu"
git push origin main
