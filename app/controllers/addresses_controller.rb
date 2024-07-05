class AddressesController < ApplicationController
  def index
    @address = Address.all
  end
end
