# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
every 1.minute do # Many shortcuts available: :hour, :day, :month, :year, :reboot
  runner "Seguimiento.delete_seg"
end

https://creatorexport.zoho.com/visualisoftweb/grupo-empresarial-cemcol/pdf/GR_Informe/&N=<%=N%>
http://www.tutorialspoint.com/ruby/ruby_input_output.htm