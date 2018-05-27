ActiveAdmin.register Customer do
 
 permit_params :email, :password, :approve, :name, :last_name, :country, :city, :addres, :phone_number, :fax, :second_email, :second_phone_number
 
 
 
 index do
    selectable_column
    id_column
    column :email
    column :name
    column :last_name
    column :country
    column :city
    column :addres
    column :phone_number
    column :fax
    column :second_email
    column :second_phone_number
    column :last_sign_in_at
    column :last_sign_in_ip
    column :created_at
    column :approved
    actions
    
    actions :defaults => false do |customer|
      link_to 'Edit', edit_admin_customer_path(customer)
      link_to 'Delete', admin_customer_path(customer), :method => :delete, :confirm => "Are you sure"
      link_to 'View', admin_customer_path(customer)
      link_to 'Approve', approve_admin_customer_path(customer), method: :put if !customer.approved?
      
    end
    
  end
  
  action_item :approve, only: :show do
  link_to 'Approve',  approve_admin_customer_path(customer), method: :put if !customer.approved?
  end
  
  member_action :approve, method: :put do
    customer = Customer.find(params[:id])
    customer.update(approved: true)
    redirect_to admin_users_path
  end



end
