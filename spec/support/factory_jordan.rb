require_relative 'travesty_factory.rb'


class FactoryJordan

  attr_reader :items, :travesties

  def create_all
    params = TravestyFactory.create_all
    @travesties = params[0]
    @items = params[1]
  end

  def create_travesty(travesty_name)
    params = TravestyFactory.create_travesty(travesty_name)
    @travesties = params[0]
    @items = params[1]
  end

end
