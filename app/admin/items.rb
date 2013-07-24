ActiveAdmin.register Item do
  form do |f|
    f.inputs "Item fields" do
      f.input :name
      f.input :description
      f.input :price
      f.input :category, as: :select, collection: Category.all
      f.input :nonprofit, as: :select, collection: Nonprofit.all
      f.input :percentage, as: :select, collection: Item::PERCENTAGES
      f.input :seller, as: :select, collection: User.all
    end
    f.inputs "Image", for: [:image, f.object.image || Image.new] do |j|
      j.input :content, as: :file
    end
  end
end
