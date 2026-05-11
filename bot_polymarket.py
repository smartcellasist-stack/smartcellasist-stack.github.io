import httpx, time
URL = 'https://polygon-mainnet.g.alchemy.com/v2/Y5wqXz5I1M4AaQaBkc4AX'
ALVO = '0xC5868E56B24957D7A0463A2f3B438E80277346A2'
def r():
    p = {'jsonrpc':'2.0','id':1,'method':'eth_blockNumber'}
    with httpx.Client() as c:
        u = int(c.post(URL,json=p).json()['result'],16)
        print('\n[ROTA DIGITAL] Radar Ligado!')
        print(f'Vigiando: ...{ALVO[-6:]}')
        while True:
            try:
                b = int(c.post(URL,json=p).json()['result'],16)
                if b > u:
                    pb = {'jsonrpc':'2.0','id':1,'method':'eth_getBlockByNumber','params':[hex(b),True]}
                    for tx in c.post(URL,json=pb).json()['result']['transactions']:
                        if tx['from'] and tx['from'].lower() == ALVO.lower():
                            print(f'\n!!! MOVIMENTACAO !!!\nHash: {tx["hash"]}')
                    u = b
                time.sleep(5)
            except: time.sleep(10)
if __name__ == '__main__': r()

