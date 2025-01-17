CREATE OR REPLACE FUNCTION rand_str(len DOUBLE PRECISION) RETURNS VARCHAR AS
$$
DECLARE
    chars VARCHAR[] := '{0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z}';
    result VARCHAR := '';
    i INTEGER := 0;
BEGIN
  FOR i IN 1..len LOOP
    result := result || chars[1+random()*(array_length(chars, 1)-1)];
  END LOOP;
  RETURN result;
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION add_n(n INTEGER) RETURNS CHAR
AS
$$
DECLARE
    t INT;
BEGIN
    SELECT MAX(id) INTO t FROM v4.publ_house;
    FOR k IN (t + 1)..(n + t + 1)
        LOOP
            INSERT INTO v4.publ_house(name, address, popularity, city_id)
            VALUES (
                (SELECT * from rand_str(FLOOR(RANDOM() * 10 + 3)) as name),
                (SELECT 'Reality 116'),
                (SELECT FLOOR(RANDOM() * 1000 + 1)),
                (SELECT FLOOR((RANDOM() * 9 + 1)))
            );
        end loop;
    RETURN 'Done with: ' || n || ' elements';
END;
$$ LANGUAGE 'plpgsql';

SELECT add_n(1000);
