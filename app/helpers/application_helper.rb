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


def get_mes(fecha)
   
   if fecha != nil

    
    meses = {"1" => "Enero", "2" => "Febrero","3"=>"Marzo","4" => "Abril", "5" => "Mayo","6"=> "Junio" ,"7"=> "Julio", "8" => "Agosto", "9"=> "Septiembre" ,"10"=> "Octubre","11" => "Noviembre" ,"12" => "Diciembre" }
    return   meses[fecha] 
end
#dias[ds] + ", " + 
end


def estado_contador(cont)

    if cont >5 

      "#0db497 !important"
    elsif cont <=5 && cont >= 0

      if action_name != "cerrados"

      "orange !important"
      else
"#0db497 !important"
      end
      else

        "#e23434 !important"

    end
      
end

def menu_index

  @menu = ["", "", "", ""]

  if (controller_name == "reports" && action_name == "index")   ||  (controller_name == "reports" && action_name == "new")
    @menu = ["active", "", "", ""]

    elsif controller_name == "customers"
      @menu = ["", "active", "", ""]

    elsif action_name == "index_prestamos"
      @menu = ["", "", "active", ""]

  end


  return @menu
  
 end

end
