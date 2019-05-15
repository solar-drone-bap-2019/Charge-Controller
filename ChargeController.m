function [P2load, P2batt] = ChargeController(P_pv, P_batt, P_load, SoC_batt)

if P_pv - P_load >= 0 && SoC_batt < 100 && SoC_batt >= (1/7)*100
    P2batt = P_pv - P_load;
    P2load = P_load;
elseif P_pv - P_load >= 0 && SoC_batt >= 100
    P2batt = 0;
    P2load = P_load;
elseif P_pv - P_load < 0 && SoC_batt >= (1/7)*100
    P2batt = P_pv - P_load;
    P2load = P_pv + P_batt;
else
    P2batt = 0;
    P2load = P_pv;
end