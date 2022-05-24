show events
SELECT * FROM INFORMATION_SCHEMA.events;

drop event sync0515clearTempBrand

ALTER EVENT leave_taken_status_change DISABLE

-- UPDATE DOCTOR
delimiter |

CREATE EVENT sync_rnd
    ON SCHEDULE
      EVERY 1 DAY
      STARTS (TIMESTAMP('2022-05-23 14:10:00'))
    DO
      BEGIN
        DECLARE dataInTempDoctors INTEGER;
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION BEGIN END;

        SET dataInTempDoctors = (SELECT count(id) FROM temp_doctors);

       IF(dataInTempDoctors > 200000) THEN 
				TRUNCATE doctors;
				INSERT INTO doctors SELECT * FROM temp_doctors; 
				TRUNCATE temp_doctors;
        END IF;
    END |

delimiter ;

-- UPDATE BRANDS
delimiter |

CREATE EVENT sync0502brands
    ON SCHEDULE
      EVERY 1 DAY
      STARTS (TIMESTAMP('2022-05-25 05:02:00'))
    DO
      BEGIN
        DECLARE dataInTempBrands INTEGER;
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION BEGIN END;

        SET dataInTempBrands = (SELECT count(id) FROM temp_brands);

       IF(dataInTempBrands > 300) THEN 
				TRUNCATE brands;
				INSERT INTO brands SELECT * FROM temp_brands; 
				TRUNCATE temp_brands;
        END IF;
    END |

delimiter ;