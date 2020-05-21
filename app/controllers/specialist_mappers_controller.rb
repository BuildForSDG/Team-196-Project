# frozen_string_literal: true

class SpecialistMappersController < ApplicationController
  before_action :set_specialist_mapper, only: %i[show update destroy]

  def index
    @specialist_mappers = SpecialistMapper.paginate(page: params[:page], per_page: 30)
    render json: {
      current_page: @specialist_mappers.current_page,

      per_page: @specialist_mappers.per_page,

      total_entries: @specialist_mappers.total_entries,
      total_pages: @specialist_mappers.total_pages,

      entries: @specialist_mappers

    }
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
