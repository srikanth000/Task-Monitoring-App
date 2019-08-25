class Project < ApplicationRecord
  belongs_to :tenant
  validates_uniqueness_of :title
  validates :free_plan_can_only_have_one_projects

  def free_plan_can_only_have_one_projects
  	if self.new_record? && (tenant.projects.count > 0) && (tenant.plan == 'free')
  		errors.add(:base, "Free plans cannot have more than one project")
  	end	
  end

  def self.by_plan_tenant(tenant_id)
  	tenant = Tenant.find(tenant.id)
  	if tenant.plan =='premium'
  		tenant.projects
  	else
  		tenant.projects.order(:id).limit(1)
    end
  end
end
