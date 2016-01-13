require_relative 'travesty_factory.rb'


class FactoryJordan

  attr_reader :items, :travesties

  def create_all
    params = TravestyFactory.create_all
    @travesties = params[0]
    @items = params[1]
  end

  def create_users(number)
    params = UserFactory.create(number)
    @users = params
  end

  def create_travesty(number)
    params = TravestyFactory.create_travesty(number)
    @travesties = params[0]
    @items = params[1]
  end

end
