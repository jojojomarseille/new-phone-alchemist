class CategoriesController < ApplicationController

  def index


    @categories = Categorie.page(params[:page]).per(12)
  end
  #ici je charge une variable categorie avec une repartition par page, au lancement de l'index

  def new

    @categorie = Categorie.new
  end

  def create

    categorie = Categorie.create(categorie_params)
    redirect_to "/categories"
  end

  def show
    @categorie = Categorie.find(params[:id])
  end

  def update
    Categorie.find(params[:id]).update name: params[:name], description: params[:description]
    redirect_to "/categories"
  end

  def destroy
    Categorie.find(params[:id]).destroy
    redirect_to "/categories"
  end

  def categorie_params
    params.require(:categorie).permit(:name, :description)
  end

end
