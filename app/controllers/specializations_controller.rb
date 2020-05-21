# frozen_string_literal: true

class SpecializationsController < ApplicationController
  before_action :set_specialization, only: %i[show update destroy]

  def index
    json_response(Specialization.all)
  end

  def show
    json_response(@specialization)
  end

  def create
    @specialization = Specialization.create!(specialization_params)
    json_response(@specialization, :created)
  end

  def update
    @specialization.update(specialization_params)
    json_response(@specialization)
  end

  def destroy
    @specialization.destroy
    head :no_content
  end

  private

  def specialization_params
    params.permit(:user_id, :name, :description)
  end

  def set_specialization
    @specialization = Specialization.find_by!(id: params[:id])
  end
end
