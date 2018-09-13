namespace :type_report do
  desc "Sends the most voted products created yesterday"
  task crear: :environment do
    
        
    Report.all.each do |report| 
        report.update(type_report: "rcc")
    end
  end
end