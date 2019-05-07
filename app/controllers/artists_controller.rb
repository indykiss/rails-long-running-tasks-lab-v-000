class ArtistsController < ApplicationController
  def index
  end

  def show
  end

  def upload 
    CSV.foreach(params[:files].path, headers: true) do |song|
      Song.create(title: song[0], artist_id: song[1])
      Artist.find_or_create(name: song[1])
    end
    redirect_to songs_path
  end 

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    @artist.update(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    flash[:notice] = "Artist deleted."
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
end
