module ApplicationHelper
  
  def find_user_cart
  @cart = Cart.find(current_user.id)
  array = @cart.join_art_carts.to_a
  @art = []
  array.each do |n| 
    @art << Artwork.find(n.artwork_id)
  end 


  # Array each do 
  return @art
  end

  def find_total_price
    @cart = Cart.find(current_user.id)
    array = @cart.join_art_carts.to_a
    @art = []
    array.each do |n| 
      @art << Artwork.find(n.artwork_id)
    end 
  @amount = 0
    @art.each do |p|
      @amount += p.price
    end 
    # Array each do 
    return @amount
    end


  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
   @devise_mapping ||= Devise.mappings[:user]
  end 
end
