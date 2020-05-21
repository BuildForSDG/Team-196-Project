class SpecialistMappersController < ApplicationController
  before_action :set_specialist_mapper, only: %i[show update destroy]

  def index
    json_response(SpecialistMapper.all)
  end

  def show
    json_response(@specialist_mapper)
  end

  def create 
    @specialist_mapper = SpecialistMapper.create!(specialist_mapper_params)
    json_response(@specialist_mapper, :created)
  end

  def update
    @specialist_mapper.update(specialist_mapper_params)
    json_response(@specialist_mapper)
  end

  def destroy
    @specialist_mapper.destroy
    head :no_content
  end

  private

  def specialist_mapper_params
    params.permit(:specialist_id, :specialization_id)
  end

  def set_specialist_mapper
    @specialist_mapper = SpecialistMapper.find_by!(id: params[:id])
  end
end
