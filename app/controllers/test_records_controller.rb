class TestRecordsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    @test_record = TestRecord.new(test_record_params)
    
    if @test_record.save
      render json: @test_record, status: :created
    else
      render json: @test_record.errors, status: :unprocessable_entity
    end
  end

  def index
    @records = TestRecord.all
    render json: { records: @records }
  end

  private

  def test_record_params
    params.require(:test_record).permit(:name, :description)
  end
end 