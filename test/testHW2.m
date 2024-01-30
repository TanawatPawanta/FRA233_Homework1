function [score] = testHW2()
    score = 0;
    flag_openloop =0;
    flag_closeloop = 0;
    flag_PO = 0;
    flag_Ts = 0;
    flag_Tp = 0;
    
    R = 4 ;
    L = 0 ;
    Kb = 0.01 ;
    Km = 0.01 ;
    Jm = 0.05 ; 
    Bm = 0.02 ;
    P = 0.003 ;
    K = 100 ;
    [num_open_test1,den_open_test1,num_close_test1,den_close_test1,K_control_test] = HW2(R,L,Kb,Km,Jm,Bm,P,K);
    tf_open_test_1 = sum(den_open_test1/num_open_test1);
    % 58664.0067
    if abs(tf_open_test_1- 5.86640067e+4) <=0.001
        flag_openloop = flag_openloop + 1;
        disp("open loop tranfer function in testcase 1 is true")
    else
        disp("open loop tranfer function in testcase 1 is wrong")
    end
    tf_close_test_1 = sum(den_close_test1/num_close_test1);
    % 587.6391
    if abs(tf_close_test_1-587.6391) <= 0.001
        flag_closeloop = flag_closeloop + 1;
        disp("close loop tranfer function in testcase 1 is true")
    else
        disp("close loop tranfer function in testcase 1 is wrong")
    end


    R = 1.1 ;
    L = 0 ;
    Kb = 1.3 ;
    Km = 1.4 ;
    Jm = 1.5 ;
    Bm = 1.6 ;
    P = 1.7 ;
    K = 1.8 ;
    [num_open_test2,den_open_test2,num_close_test2,den_close_test2,K_control_test] = HW2(R,L,Kb,Km,Jm,Bm,P,K);
    tf_open_test_2 = sum(den_open_test2/num_open_test2);
    % 13.8072
    if abs(tf_open_test_2-13.8072) <=0.001
        flag_openloop = flag_openloop + 1;
        disp("open loop tranfer function in testcase 2 is true")
    else
        disp("open loop tranfer function in testcase 2 is wrong")
    end
    
    tf_close_test_2 = sum(den_close_test2/num_close_test2(1));
    % 8.6706
    if abs(tf_close_test_2-8.6706) <= 0.001
        flag_closeloop = flag_closeloop + 1;
        disp("close loop tranfer function in testcase 2 is true")
    else
        disp("close loop tranfer function in testcase 2 is wrong")
    end


    %%%% แก้ 
    K = K_control_test;

    R = 4 ;
    L = 0 ;
    Kb = 0.01 ;
    Km = 0.01;
    Jm = 0.05 ;
    Bm = 0.02 ;
    if K > 100
        P = 3*10^-3 ;
    else
        P = 3 ;
    end
    
    [num_open_test3,den_open_test3,num_close_test3,den_close_test3,K_control_test] = HW2(R,L,Kb,Km,Jm,Bm,P,K);
    sys_test = tf(num_close_test3,den_close_test3);
    TR = stepinfo(sys_test);
    if TR.Overshoot <= 2.631578947368421
        flag_PO = 1 ;
        disp("-----------------------------------------------")
        fprintf("you answer : %.2f %%  requirement : <= 2.631578947368421 %%\n",TR.Overshoot)
        disp("Overshoot in requirement")
    else
        disp("-----------------------------------------------")
        fprintf("you answer : %.2f %%  requirement : <= 2.631578947368421 %%\n",TR.Overshoot)
        disp("Overshoot over requirement")
    end
    if TR.SettlingTime <= 25
        flag_Ts = 1 ;
        disp("-----------------------------------------------")
        fprintf("you answer : %.2f s  requirement : <= 25 s\n",TR.SettlingTime)
        disp("SettlingTime in requirement")
    else
        disp("-----------------------------------------------")
        fprintf("you answer : %.2f s  requirement : <= 25 s\n",TR.SettlingTime)
        disp("SettlingTime over requirement")
    end
    if TR.PeakTime <= 20 
        flag_Tp = 1 ;
        disp("-----------------------------------------------")
        fprintf("you answer : %.2f s  requirement : <= 20 s\n",TR.PeakTime)     
        disp("PeakTime in requirement")
        disp("=============================================================================")
        disp("")
        disp("")
    else
        disp("-----------------------------------------------")
        fprintf("you answer : %.2f s  requirement : <= 20 s\n",TR.PeakTime)     
        disp("PeakTime over requirement")
        disp("=============================================================================")
        disp("")
        disp("")
    end
    score = fix(flag_openloop/2)*1 + fix(flag_openloop/2)*fix(flag_closeloop/2)*1 + fix(flag_closeloop/2)*(flag_PO*1 + flag_Ts*1 + flag_Tp*1);
end