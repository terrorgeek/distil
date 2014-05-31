module Api
  module V1
    class AccountsController < ApplicationController
      skip_before_action :verify_authenticity_token
      def create
        @account=Account.new
        @account.name=params[:name]
        if @account.save
          render :text=>"Save successed!"
        else
          render :text=>"Save failed!"
        end
      end
  
      def show
        @account=Account.find(params[:id])
        render json: @account
      end
  
      def destroy
        @account=Account.find(params[:id]).destroy
        if @account==false
          render :text=>"Delete failed!"
        else
          render json: @account
        end
      end
      
      def update
        flag=Account.find(params[:id]).update_attributes(:name=>params[:name])
        if !flag
          render :text=>"Update failed!"
        else
          render :text=>"Update successed!"
        end
      end
    end
  end
end
