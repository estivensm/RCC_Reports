module ApplicationHelper


	def get_date(fecha)
   
   if fecha != nil

    ds = fecha.strftime("%w") #Dia de la semana
    y = fecha.strftime("%Y") #Año
    dm = fecha.strftime("%d") #Dia del mes
    m = fecha.strftime("%m") # Mes del Año
    meses = {"01" => "January", "02" => "February","03"=>"March","04" => "April", "05" => "May","06"=> "June" ,"07"=> "July", "08" => "August", "09"=> "September" ,"10"=> "October","11" => "November" ,"12" => "December" }
    dias = {"1" => "Domingo", "2" => "Lunes","3"=>"Martes","4" => "Miercoles", "5" => "Jueves","6"=> "Viernes" ,"0" =>"Sabado"}
    return  dm + " " + meses[m] + ", " + y 
end
#dias[ds] + ", " + 
end
end
