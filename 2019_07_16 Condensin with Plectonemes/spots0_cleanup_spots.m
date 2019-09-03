function info_1=spots0_cleanup_spots(info_1);

%this function screens and labels  detected  spots
%         info
                    % pos_frameno
                    % pos_X_pix
                    % pos_X_subpix
                    % content_peakvals
                    % content_perspot_est
                    % content_perspot_meas
         info_1.label_OKspot=0*info_1.pos_frameno; 
        
         
         Ic=info_1.content_perspot_meas;
         
         
        %first, get some measures: this one gets the presumed
        %single-condensin counts
        [flag,cleandata]=prf_outlier_flag(Ic,100,0.7,'positive',1); 
        sel=find(flag==1);
        info_1.label_OKspot(sel)=1;
        
%         %now, per time point
%         FF=max(info_2.pos_frameno);
%         for ii=1:FF
%             fi_2=find(info_2.pos_frameno==ii);
%             fi_1=find(info_1.pos_frameno==ii);           
%             if ~isempty(fi_2)&~isempty(fi_1);
%              xx1=info_1.pos_X_subpix(fi_1);     %positions label1
%              xx2=info_2.pos_X_subpix(fi_2);     %positions label2
%              Lc=length(xx1);
%                 for jj=1:Lc
%                     oridx=fi_1(jj); %original indices of label1;
%                     x1=xx1(jj);
%                     dd=abs(xx2-corr-x1);
%                     [min_d,~]=min(dd);  %nearest of these
%                     info_1.mindist_label1_label2(oridx)=min_d;
%                     if (min_d<psf_est)
%                         info_1.label1_label2associated(oridx)=1;
%                         
%                     end
%                 end
%             end
%         end
%         if 1
%             binax=0:0.5:50;
%             disthist=hist(info_1.mindist_label1_label2,binax);
%             figure(43); bar(binax, disthist);
%             [~]=ginput(1); close(gcf);
%         end
%         dum=1;
