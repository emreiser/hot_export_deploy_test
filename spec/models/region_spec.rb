require 'spec_helper'

describe Region do

   before(:each) do
      @attr = {
         :internal_name => "h",
         :name          => "Haiti",
	 :polygon       => "st_setsrid(st_geomfromtext('POLYGON((17.680550 35.594730,6.218446 38.349970,-1.033708 36.354170,-6.255510 35.949420,-30.836300 30.814000,-13.647330 -36.118100,53.445770 -35.880640,61.625110 -9.103512,51.630250 12.550150,44.207750 11.678600,39.780160 16.568550,34.456990 27.093960,34.653830 27.960700,34.535490 28.100640,34.937410 29.425190,34.849240 29.786660,34.148670 31.558770,17.680550 35.594730))'),4326)"
      }
      @region = Region.create(@attr)
   end

   it "should have a jobs attribute" do
      @region.should respond_to(:jobs)
   end

end
