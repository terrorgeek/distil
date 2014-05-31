require "socket"
module Api
  module V1
    class DomainsController < ApplicationController
      skip_before_action :verify_authenticity_token
       def create
         @domain=Domain.new
         @domain.hostname=params[:hostname]
         begin
           @domain.origin_ip=IPSocket.getaddress(params[:hostname])
         rescue
           render :text=>"Hostname is invalid!"
           return
         end
         
         if !params[:account_id].nil?
             @domain.account_id=params[:account_id]
         end
         if @domain.save
           render :text=>"Save successed!"
         else
           render :text=>"Save failed!"
         end
       end
  
       def show
         domain_id=params[:id] 
         DomainWorker.perform_async(domain_id,"find","")
       end
  
       def destroy
         domain_id=params[:id]
         DomainWorker.perform_async(domain_id,"destroy","")
       end
       
       def update
         domain_id=params[:id]
         DomainWorker.perform_async(domain_id,"update",params)
       end
    end
  end
end
