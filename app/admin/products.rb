ActiveAdmin.register Product do



  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :subtitle, :description, :price, :categorie_id, :zone_id, :photo
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :subtitle, :description, :price, :categorie_id, :zone_id, :photo]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
