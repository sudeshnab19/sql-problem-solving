   SELECT  
        car
        ,substring(car,1,position(' ' in car))
        ,substring(car,position(' ' in car),length(car))
        ,length(car)
    FROM
        footer  