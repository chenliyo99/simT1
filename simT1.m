%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%@author: liyong chen
%%@date: 2014-07-23
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%reference1: http://ismrm.org/11/WK_DiffPerf.htm (M.G)
TI=1700;
R1opt=1/500;

x=TI+2./R1opt*log((.75)+.25*exp(-.5*TI*R1opt));
y=TI+2./R1opt*log((.25)+.75*exp(-.5*TI*R1opt));
tau1=max(x,y);
tau2=min(x,y);


sprintf('%4.2f %4.2f\n',tau1,tau2)
ntau1=TI-tau1;
ntau2=TI-tau2;
sprintf('%4.2f %4.2f\n',ntau1,ntau2)

f=1-exp(-TI*R1opt)-2*exp(-ntau1*R1opt)+2*exp(-ntau2*R1opt)



x = ((TI+5*log(-0.25+0.25*exp(-0.2*TI*R1opt)+ 0.25*sqrt(2*(sqrt(13+12*exp(-0.2*TI*R1opt)+14*(exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt))+...
        12*(exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt))+13*(exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt))))...
        -((exp(-0.2*TI*R1opt)-1)*(exp(-0.2*TI*R1opt)-1))))/R1opt));
y = ((TI+5*log(0.25-0.25*exp(-0.2*TI*R1opt)+ 0.25*sqrt(2*(sqrt(13+12*exp(-0.2*TI*R1opt)+14*(exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt))+...
        12*(exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt))+13*(exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt))))...
-((exp(-0.2*TI*R1opt)-1)*(exp(-0.2*TI*R1opt)-1))))/R1opt));

otau1=max(x,y);
otau2=min(x,y);

sprintf('%4.2f %4.2f\n',otau1,otau2)
notau1=TI-otau1;
notau2=TI-otau2;
sprintf('%4.2f %4.2f\n',notau1,notau2)

f=1-exp(-TI*R1opt)-2*exp(-notau1*R1opt)+2*exp(-notau2*R1opt)


%reference: Magn Reson Mater Phy (2008) 21:121–130
% white and grey matter were
% found to be 646±32 and 1,197±134ms at 1.5T, 838±50
% and 1,607±112msat 3T, and 1,126±97, and 1,939±149ms
% at 7T with the MPRAGE sequence.

% For an inflow time of 1800 ms the nulling of the
% magnetization was calculated to occur after 1700 ms to
% reduce artifacts due to different signs of the signal of
% components not matching R1opt and 0.5R1opt. The positions
% of the nonselective inversion pulses are then 751 and
% 1471 ms after the labeling pulse.

%reference2:Mani S, Pauly J, Conolly S, Meyer C, Nishimura D. Background
%suppression with multiple inversion recovery nulling: applications to
%projective angiography. Magn Reson Med 1997;37(6):898-905.

%%



% %     if (m_bBackgroundSuppression) {
% %         long TI, dummy;
% %         double R1opt;
% % 
% %         // calculate timing of background suppression (BS) inversion pulses
% %         TI = m_lASLInflowTime-(long)m_dBackgroundSuppressionParameter_2;
% % 
% %         R1opt = 1.0/m_dBackgroundSuppressionParameter_1;
% %     if (m_Back==1){
% %     //Backgroundsupression optimiert für R1opt und doppelt so viel
% %       if (m_lASLMode!=6){
% %       m_bBackgroundSuppression=true;
% %           BSInvTime1 = fSDSRoundUpGRT((TI+2*log(0.25+0.75*exp(-0.5*TI*R1opt))/R1opt)*1000);
% %           BSInvTime2 = fSDSRoundUpGRT((TI+2*log(0.75+0.25*exp(-0.5*TI*R1opt))/R1opt)*1000);
% % 
% %       }
% %       else {
% %         BSInvTime1 = (long)m_dBackgroundSuppressionParameter_2*1000;  //JJ first inv immediately after labeling pulses
% %         BSInvTime2 = fSDSRoundUpGRT((TI+2*log(0.5-0.5*exp(-(TI+m_labelduration/1000.)*R1opt)+exp(-TI*R1opt))/R1opt)*1000);
% %       }
% %     }
% %     if (m_Back==2){
% %     //Backgroundsupression optimiert für R1opt und 5mal soviel
% %       m_bBackgroundSuppression=true;
% %           BSInvTime1 = fSDSRoundUpGRT((TI+5*log(-0.25+0.25*exp(-0.2*TI*R1opt)+ 0.25*sqrt(2*(sqrt(13+12*exp(-0.2*TI*R1opt)+14*(exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt))+
% %         12*(exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt))+13*(exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt))))
% %         -((exp(-0.2*TI*R1opt)-1)*(exp(-0.2*TI*R1opt)-1))))/R1opt)*1000);
% %           BSInvTime2 = fSDSRoundUpGRT((TI+5*log(0.25-0.25*exp(-0.2*TI*R1opt)+ 0.25*sqrt(2*(sqrt(13+12*exp(-0.2*TI*R1opt)+14*(exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt))+
% %         12*(exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt))+13*(exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt)*exp(-0.2*TI*R1opt))))
% %         -((exp(-0.2*TI*R1opt)-1)*(exp(-0.2*TI*R1opt)-1))))/R1opt)*1000);
% %     }
% %     if (m_Back ==3){
% %       m_bBackgroundSuppression=false;
% %     }
% %         if (BSInvTime2<BSInvTime1) {dummy=BSInvTime1; BSInvTime1=BSInvTime2; BSInvTime2=dummy;}
% %     }