%Calculating the Moving Average operation for different values of q 

% Take the .mat file to use datas inside the file 
load('Karaburun_windSpeed.mat') ;

%after checking from workspace we saw that datas were defined as y  
N = length(y) ;

% we'll need 3 different arrays for different q values
mt_five = [ ] ;
mt_twentyfive = [ ] ;
mt_hundred = [ ] ;

% for q = 5
% pay attention to be equal to 1 for the summation of first values in t and
% j because first indice of the array must be 1 not 0 
for t = 6 : 1 : (N - 5)
    summation = 0 ;
    for j = -5 : 1 : 5 
         summation =summation + y(t+j) ;
    end
    result = summation / 11 ;
    mt_five = [ mt_five ; result ] ;
end

% for q = 25
for t2 = 26 : 1 : (N - 25)
    summation2 = 0 ;
    for j2 = -25 : 1 : 25 
         summation2 = summation2 + y(t2+j2) ;
    end
    result2 = summation2 / 51 ;
    mt_twentyfive= [ mt_twentyfive ; result2 ] ;
end

% for q = 100
for t3 = 101 : 1 : (N - 100)
    summation3 = 0 ;
    for j3 = -100 : 1 : 100 
         summation3 = summation3 + y(t3+j3) ;
    end
    result3 = summation3 / 201 ;
    mt_hundred= [ mt_hundred; result3 ] ;
end

% It is not so important to write LineWidth but if you want to change the
% width of your lines you can write it in the way shown and the next
% parameter must be its width value
plot(y , 'b-' , 'LineWidth' , 1 ) ;
hold on ;
plot( mt_five , 'r-' , 'LineWidth' , 2.5 ) ;
hold on ;
plot(mt_twentyfive , 'y--' , 'LineWidth', 3) ;
hold on ;
plot(mt_hundred, 'k' , 'LineWidth', 1.5) ;
hold on ;
xlabel ( ' Time,t') ;
title ('Moving Average Example') ;
legend ('data' , '5 Term MA Trend' , '25 Term MA Trend' , '100 Term MA Trend' ) ;