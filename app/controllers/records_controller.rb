class RecordsController < ApplicationController

    before_action :set_user
    before_action :set_user_record, only: [:show, :update, :destroy ]

    def index
        json_response(@user.records)
    end

    def show
        json_response(@record)
    end

    def create
        @user.records.create!(record_params)
        json_response(@user, :created )
    end 

    def update
        @record.update(record_params)
        head :no_content
    end

    def destroy
        @record.destroy 
        head :no_content
    end

    private 

    def record_params 
        params.require(:record).permit( :user_id, :specialist_id, :description, :diagnosis)
    end

    def set_user
        @user = User.find(params[:user_id])
    end 

    def set_user_record
        @record = @user.records.find_by!(id: params[:id]) if @user
    end
end

