ActiveAdmin.register Customer do
 
 permit_params :email, :password, :approve
 
 
 
 index do
    selectable_column
    id_column
    column :email
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
  link_to 'Approve',  approve_admin_customer_path(user), method: :put if !user.approved?
  end
  
  member_action :approve, method: :put do
    customer = Customer.find(params[:id])
    customer.update(approved: true)
    redirect_to admin_users_path
  end



end
