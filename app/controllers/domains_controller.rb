class DomainsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    p=params[:hostname]
    @domain=Domain.new
    @domain.hostname="songyu"
    @domain.origin_ip="168.192.19.19"

    @domain.save!
  end
  
  def show
    
  end
  
  def destroy
    
  end
end
