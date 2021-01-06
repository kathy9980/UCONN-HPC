from collections import OrderedDict
from sentinelsat import SentinelAPI

api = SentinelAPI('user', 'password',timeout=120)

# Search Sentinel 2 by tile
tiles = ['18TYM', '18TYL', '18TXM', '18TXL'] 

query_kwargs = {
        'platformname': 'Sentinel-2',
        'producttype': 'S2MSI1C',
        'date': ('20190101', '20191231')} 

products = OrderedDict()
for tile in tiles:
    kw = query_kwargs.copy()
    kw['tileid'] = tile  # products after 2017-03-31
    # kw['filename'] = '*_T{}_*'.format(tile)  # products after 2016-12-01
    pp = api.query(**kw)
    products.update(pp)

api.download_all(products,max_attempts=10) 
