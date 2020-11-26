module ApplicationHelper
  
  def find_user_cart
    if current_user
  @cart = Cart.find(current_user.id)
  array = @cart.join_art_carts.to_a
  @art = []
  array.each do |n| 
    @art << Artwork.find(n.artwork_id)

  end 


  # Array each do 
  return @art
end 
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

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
end
