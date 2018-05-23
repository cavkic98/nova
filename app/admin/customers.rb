ActiveAdmin.register Customer do
 
 index do
    
    actions :defaults => false do |user|
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
