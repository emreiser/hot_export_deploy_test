require 'faker'

namespace :db do
   desc "Fill database with sample data"
   task :populate => :environment do
      Rake::Task['db:reset'].invoke
      
      # admin
      user_admin = User.create!(
         :email => "ck20@geofabrik.de",
         :password => "abcabcabc",
         :password_confirmation => "abcabcabc"
      )
      user_admin.confirm!
      user_admin.toggle!(:admin)

      # unconfirmed user
      user_unconfirmed = User.create!(
         :email => "ck21@geofabrik.de",
         :password => "abcabcabc",
         :password_confirmation => "abcabcabc"
      )

      # confirmed user
      user_confirmed22 = User.create!(
         :email => "ck22@geofabrik.de",
         :password => "abcabcabc",
         :password_confirmation => "abcabcabc"
      )
      user_confirmed22.confirm!
      
      user_confirmed23 = User.create!(
         :email => "ck23@geofabrik.de",
         :password => "abcabcabc",
         :password_confirmation => "abcabcabc"
      )
      user_confirmed23.confirm!

      # confirmed and suspended user
      user_suspended = User.create!(
         :email => "ck24@geofabrik.de",
         :password => "abcabcabc",
         :password_confirmation => "abcabcabc"
      )
      user_suspended.confirm!
      user_suspended.suspend!("suspended by db:populate")


      # africa
      Region.connection.execute(
         "insert into regions (id,internal_name,name,created_at,updated_at,polygon) values(1, 'africa','africa',now(),now(),st_setsrid(st_geomfromtext('POLYGON((17.680550 35.594730,6.218446 38.349970,-1.033708 36.354170,-6.255510 35.949420,-30.836300 30.814000,-13.647330 -36.118100,53.445770 -35.880640,61.625110 -9.103512,51.630250 12.550150,44.207750 11.678600,39.780160 16.568550,34.456990 27.093960,34.653830 27.960700,34.535490 28.100640,34.937410 29.425190,34.849240 29.786660,34.148670 31.558770,17.680550 35.594730))'),4326))"
      )


      # caribbean
      Region.connection.execute(
         "insert into regions (id,internal_name,name,created_at,updated_at,polygon) values(2, 'caribbean','caribbean',now(),now(),st_setsrid(st_geomfromtext('POLYGON((-60.428790 9.782485,-61.578630 9.946747,-61.998330 9.997709,-62.044320 10.427730,-61.687870 10.851500,-63.700100 11.381790,-67.293360 11.471950,-68.730660 11.742270,-69.535550 12.169730,-70.075980 12.304580,-70.374940 12.360740,-79.194240 15.481480,-83.241690 18.799220,-86.967180 23.135650,-83.149700 23.684350,-79.493200 24.167830,-79.735720 28.133000,-69.157780 26.580490,-55.996840 16.211640,-60.428790 9.782485))'),4326))"
      )

      # centralasia-middleeast
      Region.connection.execute(
         "insert into regions (id,internal_name,name,created_at,updated_at,polygon) values(3, 'centralasia-middleeast','centralasia-middleeast',now(),now(),st_setsrid(st_geomfromtext('POLYGON((34.473550 27.092930,34.659640 27.962040,34.542540 28.102480,34.944350 29.425790,34.851630 29.787340,34.152870 31.564070,25.904800 33.612720,26.566790 35.902170,24.513420 40.785750,28.620150 42.791630,40.798750 41.954700,39.736660 43.566110,44.693070 49.617460,49.376310 52.873050,71.231420 56.336520,88.663470 50.287070,87.882930 47.727830,80.337720 41.825500,74.934060 36.882980,78.796950 35.317070,74.899280 34.057260,76.167090 31.567230,71.316050 27.355170,71.541450 22.440210,60.199540 21.857940,56.333720 16.417830,51.609680 12.603080,44.215680 11.702740,39.802660 16.588340,34.473550 27.092930))'),4326))"
      )

      # indonesia
      Region.connection.execute(
         "insert into regions (id,internal_name,name,created_at,updated_at,polygon) values(4, 'indonesia','indonesia',now(),now(),st_setsrid(st_geomfromtext('POLYGON((95.947730 6.519293,92.764810 5.206835,102.750500 -8.327828,123.221000 -11.606550,132.327600 -8.641955,140.995000 -9.569642,141.012600 -9.257823,141.008200 -6.169678,141.012600 -2.566397,140.496500 -1.939047,129.290100 3.324019,126.774700 4.658980,119.063700 4.161586,118.833200 4.414538,118.570500 4.285381,118.141600 4.215412,117.838300 4.198219,117.623300 4.193986,117.502400 4.205274,117.395600 4.281464,117.249500 4.373165,116.539500 4.404166,115.860200 4.380058,115.661200 4.173388,115.547900 3.911527,115.554800 3.604769,115.496500 3.301354,115.369500 3.094426,115.208300 3.042688,115.005800 2.801209,114.926900 2.376776,114.700500 2.231817,114.522100 1.513726,113.911300 1.482649,113.630000 1.306535,113.111900 1.489555,113.084500 1.568974,112.857500 1.621343,112.367400 1.600050,112.127200 1.420492,112.092900 1.185665,111.691400 1.075151,111.197400 1.106233,110.833700 1.023346,110.569500 0.926641,110.137200 1.275455,109.770100 1.589692,109.684300 1.803760,109.660300 2.059227,109.529900 2.252526,105.440700 1.391704,104.315300 1.231244,104.018800 1.217430,103.818500 1.173225,103.579700 1.200853,103.431400 1.214667,103.091100 1.501979,102.393900 1.971537,101.441400 2.559672,100.661900 3.158571,95.947730 6.519293))'),4326))" 
      )

      # philippines
      Region.connection.execute(
         "insert into regions (id,internal_name,name,created_at,updated_at,polygon) values(5, 'philippines','philippines',now(),now(),st_setsrid(st_geomfromtext('POLYGON((116.805900 15.390120,115.632900 7.977865,117.879500 7.327625,117.859600 6.222057,119.428000 5.380353,119.043800 4.436309,119.991900 4.424338,127.800300 5.450707,123.684900 21.552770,119.986900 20.904150,116.805900 15.390120))'),4326))"
      )


      my_region = Region.find(2)


      3.times do |n|
         job = Job.create!(
            :user_id => user_confirmed22.id,
            :name => "Example Job #{n}",
            :description => "populated example job",
            :latmin => 18.9064,
            :latmax => 19.4874,
            :lonmin => -72.6417,
            :lonmax => -72.0484,
            :region_id => my_region.id
         )

         tags = Tag.default_tags 
         tags.each_key do |key|
            tags[key].each do |type, value|
               tag = Tag.new
               tag.key = key
               tag.geometrytype = type
               tag.job_id = job.id
               tag.default = value
               tag.save
            end
         end

         2.times do |m|
            run = Run.create!(
               :user_id => user_confirmed23.id,
               :job_id => job.id,
               :state => 'success'
            )
            ['shp', 'kml', 'pgs'].each do |ext|
               download = Download.create!(
                  :run_id => run.id,
                  :name => "http://www.geofabrik.de/hot_exports/#{run.id}/blub-#{ext}.zip",
                  :size => "#{m} GB"
               )
            end
         end
      end

   end
end

