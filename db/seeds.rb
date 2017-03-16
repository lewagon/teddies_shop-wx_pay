Category.destroy_all
Teddy.destroy_all

geek = Category.create!(name: 'geek')
kids = Category.create!(name: 'kids')

Teddy.create!(sku: 'original-teddy-bear', name: 'Teddy bear', category: kids, photo_url: 'http://onehdwallpaper.com/wp-content/uploads/2015/07/Teddy-Bears-HD-Images.jpg')

Teddy.create!(sku: 'jean-mimi', name: 'Jean-Michel - Le Wagon', category: geek, photo_url: 'https://pbs.twimg.com/media/B_AUcKeU4AE6ZcG.jpg:large')
Teddy.create!(sku: 'octocat',   name: 'Octocat -  GitHub',      category: geek, photo_url: 'https://cdn.shopify.com/s/files/1/0051/4802/products/mona-2_1024x1024.jpg?v=1447180277')