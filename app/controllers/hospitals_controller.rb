# frozen_string_literal: true

class HospitalsController < ApplicationController
  before_action :set_hospital, only: %i[show update destroy]

  # GET /hospitals
  def index
    @hospitals = if city_filter_param
                   Hospital.where(city: city_filter_param)
                 else
                   Hospital.all
                 end.order(name: :asc)

    render json: @hospitals
  end

  # GET /hospitals/1
  def show
    render json: @hospital
  end

  # POST /hospitals
  def create
    @hospital = Hospital.new(hospital_params)

    if @hospital.save
      render json: @hospital, status: :created, location: @hospital
    else
      render json: @hospital.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hospitals/1
  def update
    if @hospital.update(hospital_params)
      render json: @hospital
    else
      render json: @hospital.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hospitals/1
  def destroy
    @hospital.destroy
  end

  private

  def set_hospital
    @hospital = Hospital.find(params[:id])
  end

  def hospital_params
    params
      .require(:hospital)
      .permit(:name, :city, :state, :address, :phone_number)
  end

  def city_filter_param
    params.permit(:city).fetch(:city, nil)
  end
end
