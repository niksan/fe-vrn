RailsAdmin.config do |config|
  config.actions do
    dashboard
    index
    new
    export
    history_index
    bulk_delete
    show
    edit
    delete
    history_show
    show_in_app
    nestable
  end

  config.main_app_name = ['Fe Vrn', 'Admin']
  config.authorize_with :cancan
  config.current_user_method { current_user } # auto-generated
  config.audit_with :history, 'User'

  config.excluded_models = ['GritterNotice']

  [:email, :title].each do |method|
    config.label_methods << method
  end

  config.model 'Article' do
      configure :id, :integer 
      configure :title, :string 
      configure :body, :text 
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      configure :ancestry, :string 
      configure :slug, :string 
      list do
        field :id
        field :title
      end
      show do; end
      edit do; end
      export do; end
  end

  config.model 'Category' do
      nestable_tree({
        position_field: :position,
        max_depth: 3
      })
      nestable_list true
      configure :id, :integer 
      configure :name, :string 
      configure :slug, :string 
      configure :ancestry, :string 
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      object_label_method :name
      list do;
        field :id
        field :name
      end
      show do; end
      edit do;
        field :name
      end
      export do; end
   end

  config.model 'Photo' do
      configure :product, :belongs_to_association
      configure :id, :integer 
      configure :product_id, :integer
      configure :image, :string 
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      object_label_method :id
      list do; end
      show do; end
      edit do; end
      export do; end
  end

  config.model 'Product' do
      
      configure :photos, :has_many_association
      configure :id, :integer 
      configure :lot, :string 
      configure :name, :string 
      configure :description, :text 
      configure :price, :decimal 
      configure :ancestry, :string 
      configure :slug, :string 
      configure :related_products, :serialized 
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      list do; end
      show do; end
      edit do; end
      export do; end
  end

  config.model 'Role' do
      configure :id, :integer 
      configure :name, :string 
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      list do; end
      show do; end
      edit do; end
      export do; end
  end

   config.model 'User' do
      configure :id, :integer 
      configure :email, :string 
      configure :password, :password         # Hidden 
      configure :password_confirmation, :password         # Hidden 
      configure :reset_password_token, :string         # Hidden 
      configure :reset_password_sent_at, :datetime 
      configure :remember_created_at, :datetime 
      configure :sign_in_count, :integer 
      configure :current_sign_in_at, :datetime 
      configure :last_sign_in_at, :datetime 
      configure :current_sign_in_ip, :string 
      configure :last_sign_in_ip, :string 
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      list do; end
      show do; end
      edit do; end
      export do; end
  end

end
