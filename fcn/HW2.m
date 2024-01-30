function [num_open,den_open,num_close,den_close,K_control] = HW2(R,L,Kb,Km,Jm,Bm,P,K)
    % ให้นักศึกษาหา Tranfer function ในรูปเเบบของ open-loop เเละ close-loop
    % โดยเขียนในรูปเเบบของสมการติดตัวเเปร R,L,Kb,Km,Jm,Bm,P,K
    % เเละจะต้องตอบเเยกกันในส่วนของ numerator เเละ denominator
    % ซึ่งมีตัวอย่างการตอบดังนี้
    %   Tf = (b2*s^2 + b1*s + b0)/(a2*s^2 + a1*s + a0);
    %   num_tf = [b2 b1 b0];   หรือ numerator
    %   den_tf = [a2 a1 a0];   หรือ denominator

    % *** วิธีการตอบคำถาม : ให้นักศึกษาพิมพ์คำตอบเเทนที่คำว่า "Ans" ***
    % num_open : numerator ของ open-loop transfer function
    % den_open : denominator ของ open-loop transfer function
    % num_close : numerator ของ close-loop transfer function
    % den_close : denominator ของ close-loop transfer function
    % K_control : Propotional Control (ตัวควบคุม K)

    num_open = [Ans];       
    den_open = [Ans];   
    
    num_close = [Ans];
    den_close = [Ans];

    K_control = Ans;
end