class ProductSerializer
   def self.serialize(product)
      s = '{'
      s += '"name": "' + product.name + '",'
      s += '"price": "' + product.price.to_s + '",'
      s += '"inventory": ' + product.inventory.to_s + ','
      s += '"description": "' + product.description + '"'
      s+= '}'
   end
end