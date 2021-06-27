class FavoriteSerializer
  def initialize(favorite:)
    @favorite = favorite
  end

  def as_json
    {
      id: @favorite.id
    }
  end
end
