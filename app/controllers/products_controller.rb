class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]


  def index
    @les_produits = Product.page(params[:page]).per(8)
  end

   def indexadmin
    @les_produits = Product.page(params[:page]).per(12)
  end


  def show
    @product = Product.find(params[:id])
    @products =Product.categorie_id(@product.categorie.id).page(params[:page]).per(4)

  end

  def index_by_categorie
    @productby = Product.categorie_id(params[:id]).page(params[:page]).per(8)
  end

  def new
   @product = Product.new
   @categories = Categorie.all
   @zones = Zone.all

 end

  def create
    #@categories = Categorie.all
    product = Product.create(product_params)
    redirect_to "/products"
  end

  def update
    @product = Product.find(params[:id])
    Product.find(params[:id]).update title: params[:title], subtitle: params[:subtitle], description: params[:description], price: params[:price], categorie_id: params[:categorie_id], zone_id: params[:zone_id], photo: params[:photo]

    if @product.update title: params[:title]
      redirect_to "/products/#{params[:id]}"
    else
      render 'show'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to "/products"
  end



  def product_params
  params.require(:product).permit( :title, :subtitle, :description, :price_cents, :zone_id, :categorie_id, :photo, :sku)
end


end
