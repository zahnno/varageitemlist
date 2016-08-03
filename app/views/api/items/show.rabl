object @item
attributes :title, :description, :price, :status

if root_object.banned?
  attributes :created_at

  child :seller => :seller do
    attributes :name
    attributes :longitude, :latitude
  end
else
  child :seller => :seller do
    attributes :longitude, :latitude
  end
end

child :category => :category do
  attributes :name
end

