FactoryGirl.define do
  factory(:product) do
    name('Salsa')
    country_origin('Canada')
    cost('5.99')
    image('http://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/4/7/0/EA1D01_alton-salsa_s4x3.jpg.rend.hgtvcom.616.462.jpeg')
  end
end
